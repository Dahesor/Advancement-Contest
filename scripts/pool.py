from __future__ import annotations

from pathlib import Path
from typing import Tuple

import nbtlib


def replace_pool_in_folder(path: Path, find: str, replace: str) -> Tuple[int, int, int]:
    """
    Scan all files under `path` (recursively). For each NBT file:
      root["blocks"] (List) -> each element (Compound) -> element["nbt"] (Compound) -> ["pool"]
    If pool's value == find, replace with replace and save file.

    Returns: (files_scanned, files_modified, pools_replaced)
    """
    path = Path(path)
    if not path.exists() or not path.is_dir():
        raise NotADirectoryError(f"Not a directory: {path}")

    files_scanned = 0
    files_modified = 0
    pools_replaced = 0

    # 你可以按需把这里改成只匹配某些扩展名（例如 *.nbt）
    for file in path.rglob("*"):
        if not file.is_file():
            continue

        # 尝试读取为 NBT；如果不是 NBT 就跳过
        try:
            nbt = nbtlib.load(file)
        except Exception:
            continue

        files_scanned += 1
        modified_this_file = False

        root = nbt
        blocks = root["blocks"]
        if not isinstance(blocks, nbtlib.tag.List):
            continue

        for elem in blocks:

            try:
                pool = elem["nbt"]["pool"]
            except:
                continue

            # nbtlib 的 String 等 tag 通常可以用 str(tag) 取值
            try:
                pool_value = str(pool)
            except Exception:
                continue

            if pool_value == find:
                #print(pool_value)
                elem["nbt"]["pool"] = nbtlib.String(replace)
                pools_replaced += 1
                modified_this_file = True

        if modified_this_file:
            # 建议先备份再覆盖。这里直接覆盖保存。
            root.save(file)
            files_modified += 1

    return files_scanned, files_modified, pools_replaced


if __name__ == "__main__":
    # 示例用法：把 ./data 下 pool 值为 "old_pool" 的替换为 "new_pool"
    target_dir = Path("./data/gen/structure/outpost")
    find_value = "minecraft:pillager_outpost/towers"
    replace_value = "gen:outpost/towers"

    scanned, modified, replaced = replace_pool_in_folder(target_dir, find_value, replace_value)
    print(f"Scanned: {scanned} NBT files")
    print(f"Modified: {modified} files")
    print(f"Replaced: {replaced} pool tags")
