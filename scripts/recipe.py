import json
from pathlib import Path

# ============

Source = "./data/dsc_recipe/tags/recipe/"
Target = './data/dsc_recipe/function/'
SOURCE_DIR = (Path.cwd() / Source).resolve()   # 源文件夹
TARGET_DIR = (Path.cwd() / Target).resolve()   # 目标文件夹
RECURSIVE = True                          # 是否递归扫描子目录

# =================================

def write_mcfunction_lines(out_path: Path, verb: str, values: list[str]) -> None:
    """
    verb: "take" 或 "give"
    输出格式:
      recipe take @s xxx
      recipe take @s yyy
    """
    out_path.parent.mkdir(parents=True, exist_ok=True)

    lines = []
    for v in values:
        if not isinstance(v, str):
            continue
        v = v.strip()
        if not v:
            continue
        lines.append(f"recipe {verb} @s {v}")

    # mcfunction 通常用 \n；末尾加不加换行都行，这里加一个更规范
    content = "\n".join(lines) + ("\n" if lines else "")
    out_path.write_text(content, encoding="utf-8")


def process_json_file(json_path: Path, target_root: Path) -> None:
    file_id = json_path.stem  # 去掉 .json 的文件名
    try:
        data = json.loads(json_path.read_text(encoding="utf-8"))
    except UnicodeDecodeError:
        # 有些文件可能是带 BOM 或非 utf-8，尝试 utf-8-sig
        data = json.loads(json_path.read_text(encoding="utf-8-sig"))

    values = data.get("values")
    if not isinstance(values, list):
        raise ValueError(f"'values' 不是列表: {json_path}")

    out_dir = target_root / file_id
    write_mcfunction_lines(out_dir / "take.mcfunction", "take", values)
    write_mcfunction_lines(out_dir / "give.mcfunction", "give", values)


def main():
    if not SOURCE_DIR.exists():
        raise FileNotFoundError(f"源文件夹不存在: {SOURCE_DIR}")
    TARGET_DIR.mkdir(parents=True, exist_ok=True)

    pattern = "**/*.json" if RECURSIVE else "*.json"
    json_files = sorted(SOURCE_DIR.glob(pattern))

    if not json_files:
        print(f"未找到任何 json 文件: {SOURCE_DIR} (recursive={RECURSIVE})")
        return

    ok = 0
    failed = 0

    for jp in json_files:
        try:
            process_json_file(jp, TARGET_DIR)
            ok += 1
        except Exception as e:
            failed += 1
            print(f"⚠️ 处理失败: {jp}\n   原因: {e}")

    print(f"完成。成功: {ok}，失败: {failed}，输出目录: {TARGET_DIR}")

if __name__ == "__main__":
    main()