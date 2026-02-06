#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path
from typing import List, Tuple


HEX6_RE = re.compile(r"^\s*#?([0-9a-fA-F]{6})\s*$")


def load_colors(colors_txt: Path) -> List[str]:
    """
    Read colors from txt, keep FIRST-SEEN order, dedupe.
    Normalize to lowercase without '#': 'a4a8b8'
    """
    seen = set()
    ordered: List[str] = []

    for line in colors_txt.read_text(encoding="utf-8", errors="replace").splitlines():
        if not line.strip():
            continue
        m = HEX6_RE.match(line)
        if not m:
            # ignore invalid lines silently (you can change to raise if you want)
            continue
        c = m.group(1).lower()
        if c not in seen:
            seen.add(c)
            ordered.append(c)

    return ordered


def assign_chars(colors: List[str], start_codepoint: int = 0x00C0) -> List[Tuple[str, str]]:
    """
    Returns list of (char, color_hex6_lower_no_hash).
    """
    max_cp = 0x10FFFF
    if start_codepoint + len(colors) - 1 > max_cp:
        raise ValueError(f"Too many colors ({len(colors)}) to assign from U+{start_codepoint:04X}.")

    pairs: List[Tuple[str, str]] = []
    for i, color in enumerate(colors):
        cp = start_codepoint + i
        ch = chr(cp)
        pairs.append((ch, color))
    return pairs


def build_char_to_color_json(pairs: List[Tuple[str, str]]) -> dict:
    """
    {"À":"#a4a8b8", ...}
    """
    return {ch: f"#{color}" for ch, color in pairs}


def build_providers_json(pairs: List[Tuple[str, str]], ascent: int = 2, height: int = 3) -> dict:
    """
    {
      "providers":[
        {"type":"bitmap","ascent":2,"height":3,"chars":["À"],"file":"dsc:font/tiles/a4a8b8.png"},
        ...
      ]
    }
    """
    providers = []
    for ch, color in pairs:
        providers.append(
            {
                "type": "bitmap",
                "ascent": ascent,
                "height": height,
                "chars": [ch],
                "file": f"dsc:font/tiles/{color}.png",
            }
        )
    return {"providers": providers}


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Assign Unicode chars to colors and generate two JSON files."
    )
    ap.add_argument("colors_txt", help="Path to colors txt (one color per line: #RRGGBB or RRGGBB)")
    ap.add_argument("out_dir", help="Output directory for JSON files")
    ap.add_argument("--start", default="00C0", help="Start Unicode codepoint in hex (default: 00C0 for À)")
    ap.add_argument("--ascent", type=int, default=2, help="Bitmap provider ascent (default: 2)")
    ap.add_argument("--height", type=int, default=3, help="Bitmap provider height (default: 3)")
    ap.add_argument("--map-name", default="char_to_color.json", help="Output filename for char->color map JSON")
    ap.add_argument("--providers-name", default="font_providers.json", help="Output filename for providers JSON")
    args = ap.parse_args()

    colors_path = Path(args.colors_txt).expanduser().resolve()
    out_dir = Path(args.out_dir).expanduser().resolve()
    out_dir.mkdir(parents=True, exist_ok=True)

    if not colors_path.exists() or not colors_path.is_file():
        raise SystemExit(f"ERROR: colors txt not found: {colors_path}")

    start_cp = int(args.start, 16)

    colors = load_colors(colors_path)
    pairs = assign_chars(colors, start_codepoint=start_cp)

    char_to_color = build_char_to_color_json(pairs)
    providers = build_providers_json(pairs, ascent=args.ascent, height=args.height)

    map_path = out_dir / args.map_name
    providers_path = out_dir / args.providers_name

    # ensure_ascii=False so Unicode keys like "À" stay readable
    map_path.write_text(json.dumps(char_to_color, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    providers_path.write_text(json.dumps(providers, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

    print(f"Loaded colors (unique): {len(colors)}")
    print(f"Wrote: {map_path}")
    print(f"Wrote: {providers_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
