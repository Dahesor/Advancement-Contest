import json
from pathlib import Path

FUNC_DIR = (Path.cwd() / "./data/registry/function/tasks/").resolve()
TAG_PATH = (Path.cwd() / "./data/registry/tags/function/reg.json").resolve()

def get_functions() -> list[str]:
    result = []
    registry_files = sorted(FUNC_DIR.glob("**/*.mcfunction"))
    for file in registry_files:
        path = str(file)
        path = path.split("tasks\\", 1)[-1]
        path = path.split(".mcfunction", 1)[0]
        path = path.replace("\\", "/")
        #print(path)
        result.append(path)
    return result

def modify_tag(entries:list[str]) -> None:
    data: dict = json.loads(TAG_PATH.read_text(encoding="utf-8"))
    values = []
    for entry in entries:
        values.append(f"registry:tasks/{entry}")
    data["values"] = values
    TAG_PATH.write_text(
        json.dumps(data, ensure_ascii=False, indent=4) + "\n",
        encoding="utf-8"
    )

def main():
    modify_tag(get_functions())