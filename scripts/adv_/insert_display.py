import json
from pathlib import Path
from typing import Any

def insert_display(
    src_path: Path,
    lore_text: str,
    title_text: str,
    reg_id: str,
    RECEIVER_FUNCTION_DIR: Path
) -> None:
    if not src_path.exists() or not src_path.is_file():
        raise FileNotFoundError(f"JSON file not found: {src_path}")

    data: Any = json.loads(src_path.read_text(encoding="utf-8"))
    if not isinstance(data, dict):
        raise ValueError("Root JSON must be an object")

    # 确保 display 是 object
    display = data.get("display")
    if not isinstance(display, dict):
        display = {}
        data["display"] = display

    # 解析传入的 JSON 字符串
    try:
        title_json = json.loads(title_text)
    except json.JSONDecodeError as e:
        raise ValueError(f"title_text is not valid JSON: {e}") from e

    try:
        lore_json = json.loads(lore_text)
    except json.JSONDecodeError as e:
        raise ValueError(f"lore_text is not valid JSON: {e}") from e

    # 修改 display
    display["title"] = title_json
    display["description"] = lore_json
    display["show_toast"] = True
    display["announce_to_chat"] = False

    # 设置 rewards
    data["rewards"] = {
        "function": f"dsc_adv:{reg_id}"
    }

    if "sends_telemetry_event" in data:
        data.pop("sends_telemetry_event")

    # 写回文件
    src_path.write_text(
        json.dumps(data, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8"
    )

    # 确保 receiver mcfunction 存在
    RECEIVER_FUNCTION_DIR.mkdir(parents=True, exist_ok=True)
    mc_path = RECEIVER_FUNCTION_DIR / f"{reg_id}.mcfunction"

    mc_path.write_text(
    f'function dsc:module/adv/rewards/recieve {{id:"{reg_id}"}}\n',
    encoding="utf-8"
)

