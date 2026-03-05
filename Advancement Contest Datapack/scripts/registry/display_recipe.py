from pathlib import Path
import re
import json

def insert_id(registry: Path):
    file_name = registry.stem  # 不带扩展名

    trans_list = []
    trans_list.append(f"task.{file_name}")

    lines = registry.read_text(encoding="utf-8").splitlines(keepends=True)
    lore_count = get_lore_length(lines)

    assert lore_count is not None, f"文件 {registry} 中缺少 lore_length 字段"
    lore_count = min(lore_count, 12)

    lore = generate_lore(lore_count, file_name)
    lore_keys = append_trans_list(lore_count, file_name)
    title_text = f'{{"translate":"task.{file_name}","italic":false}}'

    for i, line in enumerate(lines):
        stripped = line.lstrip(" \t")
        if stripped.startswith("title:"):
            lines[i] = f'        title:{title_text},\\\n'
        elif stripped.startswith("id:"):
            lines[i] = f'    id:"{file_name}",\\\n'

    registry.write_text("".join(lines), encoding="utf-8")

    trans_list.extend(lore_keys)
    reg_id = file_name

    return trans_list, lore, title_text, reg_id

def append_trans_list(lore_count: int, file_name: str) -> list[str]:
    result = []
    i = 1
    while(True):
        result.append(f"task.{file_name}.{i}")
        i += 1
        if i > lore_count:
            break

    return result

def generate_lore(lore_count: int, file_name: str) -> str:
    i = 1
    result = ""
    while(True):
        result = result + f'{{"translate":"task.{file_name}.{i}","italic":false,"color":"gray"}}'
        i += 1
        if i > lore_count:
            break
        result = result + ', "\\n", '
    return result

def get_lore_length(lines) -> int | None:
    for line in lines:
        m = re.search(r'lore_length\s*:\s*(\d+)', line)
        if m:
            return int(m.group(1))
    return None