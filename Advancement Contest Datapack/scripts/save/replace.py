#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path
from typing import Dict, Tuple


COLOR_RE = re.compile(r"#[0-9a-fA-F]{6}")


# Common binary-ish extensions to skip
SKIP_EXTS = {
    ".png", ".jpg", ".jpeg", ".gif", ".webp", ".bmp",
    ".mp3", ".wav", ".flac", ".ogg",
    ".mp4", ".mkv", ".avi",
    ".zip", ".7z", ".rar",
    ".exe", ".dll", ".so", ".bin",
    ".ttf", ".otf", ".woff", ".woff2",
}


def load_color_to_char(map_json: Path) -> Dict[str, str]:
    """
    Input json: { "À": "#a4a8b8", ... }
    Output dict: { "a4a8b8": "À", ... }  (lowercase, no '#')
    """
    raw = json.loads(map_json.read_text(encoding="utf-8"))
    color_to_char: Dict[str, str] = {}

    if not isinstance(raw, dict):
        raise ValueError("char_to_color.json must be a JSON object/dict.")

    for ch, color in raw.items():
        if not isinstance(ch, str) or not isinstance(color, str):
            continue
        c = color.strip().lower()
        if c.startswith("#"):
            c = c[1:]
        if re.fullmatch(r"[0-9a-f]{6}", c):
            color_to_char[c] = ch

    if not color_to_char:
        raise ValueError("No valid mappings found in char_to_color.json.")
    return color_to_char


def is_likely_text(data: bytes) -> bool:
    # quick heuristic: NUL byte usually indicates binary
    return b"\x00" not in data


def replace_colors_in_text(text: str, color_to_char: Dict[str, str]) -> Tuple[str, int, int]:
    """
    Returns (new_text, replaced_count, missing_count)
    """
    replaced = 0
    missing = 0

    def repl(m: re.Match) -> str:
        nonlocal replaced, missing
        token = m.group(0)          # e.g. "#A4A8B8"
        key = token[1:].lower()     # "a4a8b8"
        ch = color_to_char.get(key)
        if ch is None:
            missing += 1
            return token
        replaced += 1
        return ch

    new_text = COLOR_RE.sub(repl, text)
    return new_text, replaced, missing


def iter_files(root: Path):
    for p in root.rglob("*"):
        if p.is_file():
            yield p


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Replace #RRGGBB colors in text files with mapped Unicode chars."
    )
    ap.add_argument("folder", help="Target folder to process (recursive)")
    ap.add_argument("map_json", help="Path to char_to_color.json")
    ap.add_argument("--no-backup", action="store_true", help="Do not create .bak backups")
    ap.add_argument("--dry-run", action="store_true", help="Do not write changes, only report")
    ap.add_argument("--include-ext", action="append", default=[],
                    help="Only process files with this extension (e.g. --include-ext .mcfunction). Can repeat.")
    ap.add_argument("--encoding", default="utf-8", help="Preferred encoding when reading/writing (default: utf-8)")
    args = ap.parse_args()

    root = Path(args.folder).expanduser().resolve()
    map_path = Path(args.map_json).expanduser().resolve()

    if not root.exists() or not root.is_dir():
        raise SystemExit(f"ERROR: folder not found: {root}")
    if not map_path.exists() or not map_path.is_file():
        raise SystemExit(f"ERROR: map json not found: {map_path}")

    color_to_char = load_color_to_char(map_path)

    include_exts = [e if e.startswith(".") else f".{e}" for e in args.include_ext]
    include_exts = [e.lower() for e in include_exts]

    files_touched = 0
    total_replaced = 0
    total_missing = 0
    skipped_binary = 0
    skipped_ext = 0

    for f in iter_files(root):
        if f.suffix.lower() in SKIP_EXTS:
            continue

        if include_exts and f.suffix.lower() not in include_exts:
            skipped_ext += 1
            continue

        try:
            data = f.read_bytes()
        except Exception:
            continue

        if not is_likely_text(data):
            skipped_binary += 1
            continue

        # best-effort decode: try preferred encoding then fallback
        try:
            text = data.decode(args.encoding)
        except UnicodeDecodeError:
            try:
                text = data.decode("utf-8-sig")
            except UnicodeDecodeError:
                try:
                    text = data.decode("cp1252")
                except UnicodeDecodeError:
                    # last resort: latin-1 (won't fail, but may be garbage)
                    text = data.decode("latin-1")

        new_text, replaced, missing = replace_colors_in_text(text, color_to_char)

        if replaced == 0:
            # even if missing>0, replacement didn't happen; still report missing only if you want
            total_missing += missing
            continue

        total_replaced += replaced
        total_missing += missing
        files_touched += 1

        if args.dry_run:
            continue

        if not args.no_backup:
            bak = f.with_suffix(f.suffix + ".bak")
            try:
                # don't overwrite existing backup
                if not bak.exists():
                    bak.write_bytes(data)
            except Exception:
                pass

        # write back as utf-8 by default (safe for Unicode chars)
        f.write_text(new_text, encoding="utf-8")

    print(f"Processed folder: {root}")
    print(f"Files modified: {files_touched}")
    print(f"Total replacements made: {total_replaced}")
    print(f"Colors with no mapping (left unchanged): {total_missing}")
    if include_exts:
        print(f"Filtered by extensions: {include_exts} (skipped {skipped_ext} files by ext)")
    print(f"Skipped likely-binary files: {skipped_binary}")
    if args.dry_run:
        print("Dry-run: no files written.")
    else:
        print("Note: modified files were written as UTF-8 (to support Unicode chars).")
        if not args.no_backup:
            print("Backups: created *.bak next to files (if not already existing).")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
