from pathlib import Path
import json

# 允许的 type 集合
ALLOWED_TYPES = {
    "blasting",
    "minecraft:blasting",
    "smelting",
    "minecraft:smelting",
    "smoking",
    "minecraft:smoking",
}

def clean_recipe_jsons(folder: str | Path) -> None:
    folder = Path(folder)

    if not folder.exists() or not folder.is_dir():
        raise ValueError(f"Invalid folder path: {folder}")

    for json_file in folder.glob("*.json"):
        try:
            with json_file.open("r", encoding="utf-8") as f:
                data = json.load(f)

            # 根节点不是 dict → 删除
            if not isinstance(data, dict):
                json_file.unlink()
                continue

            recipe_type = data.get("type")

            # 没有 type 或 type 不在允许范围 → 删除
            if recipe_type not in ALLOWED_TYPES:
                json_file.unlink()

        except Exception:
            # JSON 解析失败、编码错误等 → 删除
            json_file.unlink()


if __name__ == "__main__":
    # 示例：替换为你的目标文件夹路径
    target_folder = r"./data/minecraft/recipe/"
    clean_recipe_jsons(target_folder)
