from typing import Optional
from pathlib import Path
from typing import Any
import re
import json

def read_recipe_tag(tag: Path, DEFAULT_TEXT_FORMAT):
    data = json.loads(tag.read_text(encoding="utf-8"))
    values = data.get("values", [])

    header: dict[str, Any] = DEFAULT_TEXT_FORMAT.copy()
    result_text: list[dict[str, Any]] = [header]
    trans_list = []

    for v in values:
        key = f"recipe.{v}"
        trans_list.append(key)
        result_text.append({
            "translate": key,
            "extra": ["\n"]
        })
    result = json.dumps(result_text, ensure_ascii=False, separators=(",", ":"))
    return result, trans_list



def get_recipe_tag(registry: Path, lookfor: str) -> tuple[Optional[Path], Optional[str], str]:

    # 读取文件行
    lines = registry.read_text(encoding="utf-8").splitlines()

    target_line = None
    for line in lines:
        if line.lstrip(" \t").startswith(lookfor):
            target_line = line
            break

    if target_line is None:
        return None, None, ""

    # 提取 recipe:"namespace:path"
    m = re.search(r'recipe\s*:\s*"([^"]+)"', target_line)
    if not m:
        return None, None, ""

    ns_id = m.group(1).strip()  # namespace:path
    if ":" not in ns_id:
        return None, None, ""

    tar_namespace = ns_id

    namespace, path_part = ns_id.split(":", 1)
    file_name = path_part.split("/", 1)[-1]
    file_name = "dsc_recipe:" + file_name

    # 组合为 ./data/<namespace>/tags/recipe/<path>.json
    expanded = Path("./data") / namespace / "tags" / "recipe" / f"{path_part}.json"
    return (Path.cwd() / expanded).resolve(), tar_namespace, file_name