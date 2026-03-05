from __future__ import annotations
from pathlib import Path
from typing import Iterable
import json
import re


# Match: recipe take @s <id...>  (stop at whitespace)
_RECIPE_TAKE_RE = re.compile(r"recipe\s+take\s+@s\s+([^\s]+)")


def _iter_recipe_ids_from_lines(lines: Iterable[str]) -> set[str]:
    ids: set[str] = set()

    for line in lines:
        for m in _RECIPE_TAKE_RE.finditer(line):
            rid = m.group(1).strip()
            if not rid:
                continue

            # Skip namespaced or path-like ids
            if ":" in rid or "/" in rid:
                continue

            # Strip "_from_*" suffix if present
            idx = rid.find("_from_")
            if idx != -1:
                rid = rid[:idx]

            if rid:
                ids.add(rid)

    return ids


def port_recipe_to_lang(source_file: Path, target_file: Path) -> None:
    """
    Read source_file line by line, extract ids after 'recipe take @s '.
    - Skip ids containing ':' or '/'
    - If id contains '_from_', strip it and everything after it
    - Deduplicate ids
    Then load target_file as JSON object and set/create keys 'si.<id>' to "".
    Do not modify other keys.
    """
    if not source_file.is_file():
        raise FileNotFoundError(f"source_file not found: {source_file}")

    # Extract ids
    with source_file.open("r", encoding="utf-8") as f:
        ids = _iter_recipe_ids_from_lines(f)

    # Load existing target json
    if not target_file.is_file():
        raise FileNotFoundError(f"target_file not found: {target_file}")

    with target_file.open("r", encoding="utf-8") as f:
        data = json.load(f)

    if not isinstance(data, dict):
        raise ValueError("target_file JSON root must be an object (dict).")

    # Update / create only the needed keys
    for rid in sorted(ids):
        key = f"si.{rid}"
        prev_value = data[key]
        if not isinstance(prev_value,str):
            continue
        if re.match(r"\\u[eE][fF]",prev_value.encode("unicode_escape").decode()):
            continue
        data[key] = ""

    # Write back
    target_file.parent.mkdir(parents=True, exist_ok=True)
    with target_file.open("w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=True, indent=2)
        f.write("\n")

def main():
    source = Path("./data/dsc_recipe/function/init_remove/take.mcfunction")
    target = Path("../../../../resourcepacks/Survival Competition Resources/lang/assets/si/lang/en_us.json")
    port_recipe_to_lang(source, target)

if __name__ == "__main__":
    main()