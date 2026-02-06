#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from __future__ import annotations

import argparse
import re
import zlib
import struct
from pathlib import Path
from typing import Iterable, Tuple, Set


HEX6_RE = re.compile(r"^\s*#?([0-9a-fA-F]{6})\s*$")


def _crc(chunk_type: bytes, data: bytes) -> int:
    import binascii
    return binascii.crc32(chunk_type + data) & 0xFFFFFFFF


def _png_chunk(chunk_type: bytes, data: bytes) -> bytes:
    length = struct.pack(">I", len(data))
    crc = struct.pack(">I", _crc(chunk_type, data))
    return length + chunk_type + data + crc


def make_1x1_png_rgb(r: int, g: int, b: int) -> bytes:
    """
    Create a minimal 1x1 PNG, color type 2 (truecolor), 8-bit depth, no alpha.
    """
    signature = b"\x89PNG\r\n\x1a\n"

    # IHDR: width=1, height=1, bit depth=8, color type=2 (RGB),
    # compression=0, filter=0, interlace=0
    ihdr_data = struct.pack(">IIBBBBB", 1, 1, 8, 2, 0, 0, 0)
    ihdr = _png_chunk(b"IHDR", ihdr_data)

    # Image data: each scanline begins with filter byte (0), then RGB bytes
    raw = bytes([0, r, g, b])
    compressed = zlib.compress(raw, level=9)
    idat = _png_chunk(b"IDAT", compressed)

    iend = _png_chunk(b"IEND", b"")

    return signature + ihdr + idat + iend


def parse_colors(lines: Iterable[str]) -> Tuple[Set[str], list[str]]:
    """
    Returns (valid_set, invalid_lines)
    Valid colors are returned as lowercase hex without '#', e.g. 'a4a8b8'.
    """
    valid: Set[str] = set()
    invalid: list[str] = []

    for line in lines:
        if not line.strip():
            continue
        m = HEX6_RE.match(line)
        if not m:
            invalid.append(line.rstrip("\n"))
            continue
        valid.add(m.group(1).lower())

    return valid, invalid


def hex_to_rgb(hex6: str) -> Tuple[int, int, int]:
    r = int(hex6[0:2], 16)
    g = int(hex6[2:4], 16)
    b = int(hex6[4:6], 16)
    return r, g, b


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Generate 1x1 PNG files for each #RRGGBB color in a txt file."
    )
    ap.add_argument("colors_txt", help="Path to colors txt (one color per line, e.g. #A4A8B8)")
    ap.add_argument("out_dir", help="Target output folder")
    ap.add_argument("--overwrite", action="store_true", help="Overwrite existing files")
    ap.add_argument("--report-invalid", action="store_true", help="Print invalid lines (if any)")
    args = ap.parse_args()

    colors_path = Path(args.colors_txt).expanduser().resolve()
    out_dir = Path(args.out_dir).expanduser().resolve()
    out_dir.mkdir(parents=True, exist_ok=True)

    if not colors_path.exists() or not colors_path.is_file():
        raise SystemExit(f"ERROR: colors txt not found: {colors_path}")

    lines = colors_path.read_text(encoding="utf-8", errors="replace").splitlines()
    valid, invalid = parse_colors(lines)

    if args.report_invalid and invalid:
        print("Invalid lines (ignored):")
        for s in invalid:
            print(f"  {s}")

    written = 0
    skipped = 0

    for hex6 in sorted(valid):
        r, g, b = hex_to_rgb(hex6)
        png_bytes = make_1x1_png_rgb(r, g, b)

        out_file = out_dir / f"{hex6}.png"
        if out_file.exists() and not args.overwrite:
            skipped += 1
            continue

        out_file.write_bytes(png_bytes)
        written += 1

    print(f"Found {len(valid)} valid colors.")
    print(f"Wrote {written} PNG(s) to: {out_dir}")
    if skipped:
        print(f"Skipped {skipped} existing file(s). Use --overwrite to replace.")
    if invalid:
        print(f"Ignored {len(invalid)} invalid line(s). Use --report-invalid to list them.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
