from __future__ import annotations

import json
import shutil
from pathlib import Path
from typing import Union


_ALLOWED_TYPES = {
    "minecraft:crafting_shaped",
    "crafting_shaped",
    "minecraft:crafting_shapeless",
    "crafting_shapeless",
}


def store_recipes(source: Union[str, Path], target: Union[str, Path]) -> int:
    """
    Copy recipe json files from `source` to `target` if:
      - the JSON root is an object (dict)
      - and root["type"] is one of the allowed crafting types

    Returns:
        Number of files copied.
    """
    src = Path(source).expanduser().resolve()
    dst = Path(target).expanduser().resolve()

    if not src.exists() or not src.is_dir():
        raise NotADirectoryError(f"source is not a folder: {src}")

    dst.mkdir(parents=True, exist_ok=True)

    copied = 0

    for json_path in (p for p in src.rglob("*.json") if p.is_file()):
        try:
            text = json_path.read_text(encoding="utf-8")
        except UnicodeDecodeError:
            # tolerate BOM / weird encodings
            text = json_path.read_text(encoding="utf-8-sig", errors="strict")

        try:
            data = json.loads(text)
        except json.JSONDecodeError:
            continue

        if not isinstance(data, dict):
            continue

        t = data.get("type")
        if t not in _ALLOWED_TYPES:
            continue

        rel = json_path.relative_to(src)
        out_path = dst / rel
        out_path.parent.mkdir(parents=True, exist_ok=True)

        shutil.copy2(json_path, out_path)
        copied += 1

    return copied

if __name__ == "__main__":
    store_recipes("C:/ProgramData/MCDATA/data/minecraft/recipe", "./edat/data/rlw/recipe/")