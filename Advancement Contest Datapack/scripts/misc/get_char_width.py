from __future__ import annotations

import json
import re
from pathlib import Path
from typing import Dict

from PIL import Image

try:
    import numpy as np
except Exception:  # numpy is optional
    np = None


_PAGE_RE = re.compile(r"^unicode_page_([0-9a-fA-F]{2})\.png$")


def _glyph_width_rgba_16x16(cell_rgba: Image.Image) -> int:
    """
    Width definition:
    from the left edge (x=0) to the right-most column that has ANY pixel with alpha > 0.
    Return 0 if the glyph is fully transparent.
    """
    if cell_rgba.mode != "RGBA":
        cell_rgba = cell_rgba.convert("RGBA")

    if np is not None:
        a = np.asarray(cell_rgba, dtype=np.uint8)[:, :, 3]  # (16,16)
        col_has_ink = (a > 0).any(axis=0)                   # (16,)
        if not col_has_ink.any():
            return 0
        max_x = int(np.nonzero(col_has_ink)[0].max())
        return max_x + 1

    # Pure-PIL fallback (no numpy)
    alpha = cell_rgba.getchannel("A")  # 16x16, 0..255
    px = alpha.load()
    max_x = -1
    for x in range(16):
        for y in range(16):
            if px[x, y] > 0:
                if x > max_x:
                    max_x = x
                break
    return 0 if max_x < 0 else (max_x + 1)


def get_char_width(target_dir: Path, output_file: Path) -> None:
    """
    Scan all files matching unicode_page_<xy>.png under target_dir (non-recursive).
    <xy> is the high byte (00..ff) of a BMP code point. Example: U+3A3F -> unicode_page_3a.png.
    For each page image:
      - image is 256x256
      - 16x16 grid of 16x16 glyph cells
      - glyph index i (0..255) maps to codepoint: (high_byte << 8) | i
    Output JSON: { "<char>": <width>, ... } with ensure_ascii=False.
    """
    target_dir = Path(target_dir)
    output_file = Path(output_file)

    if not target_dir.exists() or not target_dir.is_dir():
        raise FileNotFoundError(f"target_dir not found or not a directory: {target_dir}")

    widths: Dict[str, int] = {}

    for path in sorted(target_dir.iterdir(), key=lambda p: p.name.lower()):
        if not path.is_file():
            continue

        m = _PAGE_RE.match(path.name)
        if not m:
            continue

        high_hex = m.group(1)
        high = int(high_hex, 16)

        with Image.open(path) as im:
            im = im.convert("RGBA")
            w, h = im.size
            if (w, h) != (256, 256):
                raise ValueError(f"{path.name}: expected 256x256, got {w}x{h}")

            # 256 glyphs: left->right, top->bottom
            for i in range(256):
                gx = i % 16
                gy = i // 16
                x0 = gx * 16
                y0 = gy * 16
                cell = im.crop((x0, y0, x0 + 16, y0 + 16))

                codepoint = (high << 8) | i
                ch = chr(codepoint)
                widths[ch] = _glyph_width_rgba_16x16(cell)

    output_file.parent.mkdir(parents=True, exist_ok=True)
    with output_file.open("w", encoding="utf-8") as f:
        # Sorting keys by Unicode codepoint makes diffs stable and predictable
        items = sorted(widths.items(), key=lambda kv: ord(kv[0]))
        json.dump(dict(items), f, ensure_ascii=False, indent=4)


def _main():
    get_char_width(Path("../../../../resourcepacks/Survival Competition Resources/assets/sidebar.dah/textures/font/unicode"), Path("./scripts/__data/width.json"))

if __name__ == "__main__":
    _main()