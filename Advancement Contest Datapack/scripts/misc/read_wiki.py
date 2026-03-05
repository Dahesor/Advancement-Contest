#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from __future__ import annotations

import argparse
import re
import time
from pathlib import Path
from urllib.parse import urljoin

import requests
from bs4 import BeautifulSoup

API = "https://zh.minecraft.wiki/api.php"
BASE = "https://zh.minecraft.wiki"

SAFE_NAME_RE = re.compile(r"[^0-9A-Za-z._-]+")
THUMB_SIZE_RE = re.compile(r"/(\d+)px-")  # matches .../16px-...


def sanitize_filename(name: str) -> str:
    name = name.strip()
    name = SAFE_NAME_RE.sub("_", name).strip("._-")
    return name or "unnamed"


def mw_api_get(session: requests.Session, params: dict, timeout: int = 30) -> dict:
    r = session.get(API, params=params, timeout=timeout)
    r.raise_for_status()
    return r.json()


def parse_page_html(session: requests.Session, page: str) -> str:
    data = mw_api_get(
        session,
        {
            "action": "parse",
            "page": page,
            "prop": "text",
            "format": "json",
            "formatversion": "2",
        },
    )
    return data["parse"]["text"]


def find_target_table(soup: BeautifulSoup):
    for table in soup.find_all("table"):
        header_text = " ".join(th.get_text(strip=True) for th in table.find_all("th"))
        if ("图标" in header_text) and ("命名空间ID" in header_text):
            return table
    return None


def pick_best_img_url(img_tag, base_url: str) -> str | None:
    """
    Prefer the largest candidate in srcset/data-srcset. Fallback to src/data-src.
    """
    def parse_srcset(srcset: str) -> list[tuple[str, float]]:
        out: list[tuple[str, float]] = []
        for part in srcset.split(","):
            part = part.strip()
            if not part:
                continue
            seg = part.split()
            u = seg[0].strip()
            score = 0.0
            if len(seg) >= 2:
                s = seg[1].strip()
                if s.endswith("x"):
                    try:
                        score = float(s[:-1])
                    except ValueError:
                        score = 0.0
                elif s.endswith("px"):
                    try:
                        score = float(s[:-2])
                    except ValueError:
                        score = 0.0
            out.append((u, score))
        out.sort(key=lambda t: t[1])
        return out

    srcset = img_tag.get("data-srcset") or img_tag.get("srcset")
    if srcset:
        cands = parse_srcset(srcset)
        if cands:
            return urljoin(base_url, cands[-1][0])

    src = img_tag.get("data-src") or img_tag.get("src")
    if src:
        return urljoin(base_url, src)

    return None


def upscale_thumb_url(url: str, width: int) -> str:
    """
    If url looks like /.../16px-foo.png, replace 16 with width.
    If no size segment, return as-is.
    """
    return THUMB_SIZE_RE.sub(f"/{width}px-", url, count=1)


def detect_ext(url: str) -> str:
    u = url.split("?", 1)[0]
    ext = Path(u).suffix.lower()
    return ext if ext else ".png"


def download(session: requests.Session, url: str, out_path: Path) -> None:
    r = session.get(url, timeout=30, stream=True)
    r.raise_for_status()
    out_path.parent.mkdir(parents=True, exist_ok=True)
    with out_path.open("wb") as f:
        for chunk in r.iter_content(1024 * 64):
            if chunk:
                f.write(chunk)


def scrape_icons(page: str, out_dir: Path, width: int = 256, sleep_s: float = 0.2) -> None:
    out_dir.mkdir(parents=True, exist_ok=True)

    sess = requests.Session()
    sess.headers.update(
        {"User-Agent": "mcw-icon-scraper/1.1 (MediaWiki API; no direct page fetch)"}
    )

    html = parse_page_html(sess, page)
    soup = BeautifulSoup(html, "html.parser")

    table = find_target_table(soup)
    if table is None:
        raise RuntimeError("找不到目标表（表头未匹配到：图标 / 命名空间ID）。")

    saved = 0
    failed = 0

    for tr in table.find_all("tr"):
        tds = tr.find_all("td")
        if len(tds) < 3:
            continue

        icon_td = tds[0]
        id_td = tds[2]

        item_id = id_td.get_text(strip=True)
        if not item_id:
            continue

        img = icon_td.find("img")
        if img is None:
            failed += 1
            continue

        img_url = pick_best_img_url(img, BASE)
        if not img_url:
            failed += 1
            continue

        # 尽量要更大图（如果本来就是原图/大图，这一步不会伤害）
        big_url = upscale_thumb_url(img_url, width)

        ext = detect_ext(big_url)
        fname = sanitize_filename(item_id) + ext
        out_path = out_dir / fname

        try:
            download(sess, big_url, out_path)
            saved += 1
            print(f"[OK] {item_id} -> {fname}")
        except Exception:
            # 如果改宽度后的 thumb 不存在，回退到原始 img_url
            try:
                download(sess, img_url, out_path)
                saved += 1
                print(f"[OK-fallback] {item_id} -> {fname}")
            except Exception as e:
                failed += 1
                print(f"[FAIL] {item_id} err={e}")

        if sleep_s > 0:
            time.sleep(sleep_s)

    print(f"\nDone. saved={saved}, failed={failed}, out_dir={out_dir.resolve()}")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--page", default="Java版数据值/方块ID", help="Wiki页面标题（不是URL）")
    ap.add_argument("--out", default="mc_icons", help="输出目录")
    ap.add_argument("--width", type=int, default=256, help="想要的缩略图宽度（例如 256/512）")
    ap.add_argument("--sleep", type=float, default=0.1, help="下载间隔秒")
    args = ap.parse_args()

    scrape_icons(args.page, Path(args.out), width=args.width, sleep_s=args.sleep)


if __name__ == "__main__":
    main()