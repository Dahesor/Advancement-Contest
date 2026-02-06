#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from __future__ import annotations

import argparse
import io
import os
import re
import sys
import zipfile
from pathlib import Path
from typing import Iterable, Iterator, Set, Optional


# Match "#RRGGBB" where R,G,B are hex digits
HEX_COLOR_RE = re.compile(r"#[0-9a-fA-F]{6}")


def iter_files_in_dir(root: Path) -> Iterator[Path]:
    for p in root.rglob("*"):
        if p.is_file():
            yield p


def read_text_best_effort(data: bytes) -> Optional[str]:
    """
    Try to decode bytes into text. Return None if it likely isn't text.
    """
    # quick binary heuristic: if too many NUL bytes, treat as binary
    if data.count(b"\x00") > 0:
        return None

    for enc in ("utf-8", "utf-8-sig", "cp1252", "latin-1"):
        try:
            return data.decode(enc)
        except UnicodeDecodeError:
            continue
    return None


def extract_colors_from_text(text: str) -> Set[str]:
    # Normalize to uppercase
    return {m.group(0).upper() for m in HEX_COLOR_RE.finditer(text)}


def extract_from_file(path: Path, max_bytes: int = 10_000_000) -> Set[str]:
    """
    Read a file and extract colors. Skips very large files by default.
    """
    try:
        size = path.stat().st_size
        if size > max_bytes:
            return set()

        data = path.read_bytes()
        text = read_text_best_effort(data)
        if text is None:
            return set()

        return extract_colors_from_text(text)
    except Exception:
        return set()


def extract_from_zip(zip_path: Path, max_member_bytes: int = 10_000_000) -> Set[str]:
    colors: Set[str] = set()
    try:
        with zipfile.ZipFile(zip_path, "r") as zf:
            for info in zf.infolist():
                if info.is_dir():
                    continue
                # skip huge members
                if info.file_size > max_member_bytes:
                    continue
                try:
                    data = zf.read(info.filename)
                except Exception:
                    continue

                text = read_text_best_effort(data)
                if text is None:
                    continue
                colors |= extract_colors_from_text(text)
    except Exception:
        pass
    return colors


def extract_colors(input_path: Path) -> Set[str]:
    if input_path.is_file() and input_path.suffix.lower() == ".zip":
        return extract_from_zip(input_path)

    if input_path.is_file():
        return extract_from_file(input_path)

    if input_path.is_dir():
        colors: Set[str] = set()
        for f in iter_files_in_dir(input_path):
            # optionally ignore common binary-ish extensions
            if f.suffix.lower() in {
                ".png", ".jpg", ".jpeg", ".gif", ".webp", ".bmp",
                ".mp3", ".wav", ".flac", ".ogg",
                ".mp4", ".mkv", ".avi",
                ".zip", ".7z", ".rar",
                ".exe", ".dll", ".so", ".bin",
            }:
                continue
            colors |= extract_from_file(f)
        return colors

    return set()


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Extract all #RRGGBB hex colors from a folder/file/zip and write one per line."
    )
    parser.add_argument("input", help="Path to a folder, a file, or a .zip")
    parser.add_argument(
        "-o", "--output", default="colors.txt",
        help="Output txt file path (default: colors.txt)"
    )
    parser.add_argument(
        "--keep-order", action="store_true",
        help="Keep first-seen order (slower). Default outputs sorted."
    )
    args = parser.parse_args()

    in_path = Path(args.input).expanduser().resolve()
    out_path = Path(args.output).expanduser().resolve()

    if not in_path.exists():
        print(f"ERROR: input path not found: {in_path}", file=sys.stderr)
        return 2

    if args.keep_order:
        # order-preserving: collect in list + set
        seen: Set[str] = set()
        ordered: list[str] = []

        def add_colors(cols: Iterable[str]) -> None:
            for c in cols:
                if c not in seen:
                    seen.add(c)
                    ordered.append(c)

        if in_path.is_file() and in_path.suffix.lower() == ".zip":
            # zip order is defined by zip entries
            try:
                with zipfile.ZipFile(in_path, "r") as zf:
                    for info in zf.infolist():
                        if info.is_dir():
                            continue
                        try:
                            data = zf.read(info.filename)
                        except Exception:
                            continue
                        text = read_text_best_effort(data)
                        if text is None:
                            continue
                        add_colors(m.group(0).upper() for m in HEX_COLOR_RE.finditer(text))
            except Exception:
                pass
        elif in_path.is_dir():
            for f in iter_files_in_dir(in_path):
                cols = extract_from_file(f)
                add_colors(cols)
        else:
            add_colors(extract_from_file(in_path))

        out_path.write_text("\n".join(ordered) + ("\n" if ordered else ""), encoding="utf-8")
        print(f"Wrote {len(ordered)} colors -> {out_path}")
        return 0

    # default: sorted unique
    colors = extract_colors(in_path)
    sorted_colors = sorted(colors)
    out_path.write_text("\n".join(sorted_colors) + ("\n" if sorted_colors else ""), encoding="utf-8")
    print(f"Wrote {len(sorted_colors)} colors -> {out_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())