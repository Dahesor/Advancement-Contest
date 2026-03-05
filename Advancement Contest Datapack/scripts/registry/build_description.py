from pathlib import Path
import re
import json

def description(registry:Path, lore_text:str):
    lines = registry.read_text(encoding="utf-8").splitlines(keepends=True)
    nl = ', "\\n", '
    all_emerald, all_score, first_emerald, first_score, addtion_all, addtion_first, recipe_sum_all, recipe_sum_first = read_lores(lines)

    if all_emerald > 0 or all_score > 0 or addtion_all != "" or recipe_sum_all != "":
        lore_text += nl
        lore_text += f'{{"translate":"task.reward","italic":false,"color":"light_purple"}}'
        lore_text += build_reward(all_emerald, all_score, addtion_all, recipe_sum_all)
    if first_emerald > 0 or first_score > 0 or addtion_first != "" or recipe_sum_first != "":
        lore_text += nl
        lore_text += f'{{"translate":"task.reward_first","italic":false,"color":"light_purple"}}'
        lore_text += build_reward(first_emerald, first_score, addtion_first, recipe_sum_first)

    lore_text = '[' + lore_text + ']'

    for i, line in enumerate(lines):
        stripped = line.lstrip(" \t")
        if stripped.startswith("lore:"):
            lines[i] = f'        lore:{lore_text},\\\n'

    registry.write_text("".join(lines), encoding="utf-8")
    return lore_text

def build_reward (emerald, score, text, recipe)-> str:
    try:
        recipe_data = json.loads(recipe)
    except json.JSONDecodeError:
        recipe_data = []
    if not isinstance(recipe_data, list):
        recipe_data = []

    json_res = []
    for s in recipe_data:
        s = "si." + s
        json_res.append({"translate": s})
    if len(json_res) > 0:
        json_res.insert(0, {"text":"","font": "dsc:tasks/recipe","underlined":False,"color":"white"})

    #print(json.dumps(json_res, ensure_ascii=False))
    result = ""
    nl = ', "\\n", '
    if score > 0:
        result += nl
        result += f'{{"translate":"reward.score","italic":false,"color":"gold","with":["{score}"]}}'
    if emerald > 0:
        result += nl
        result += f'{{"translate":"reward.emerald","italic":false,"color":"green","with":["{emerald}"]}}'
    if text != "":
        result += nl
        result += f'{{"text":"{text}","italic":false,"color":"gray"}}'
    if len(recipe_data) > 0:
        result += nl
        result += '{"translate":"reward.recipe","italic":false,"color":"aqua"}'
        if len(json_res) > 0:
            result += nl
            result += json.dumps(json_res, ensure_ascii=False)
    return result

def read_lores(lines):
    first_emerald, first_score = 0, 0
    all_emerald, all_score = 0, 0
    addtion_all, addtion_first = "", ""
    recipe_sum_all, recipe_sum_first = "", ""
    for i, line in enumerate(lines):
        stripped = line.lstrip(" \t")
        if stripped.startswith("all_reward:"):
            all_emerald, all_score = get_reward_values(stripped)
        elif stripped.startswith("first_reward:"):
            first_emerald, first_score = get_reward_values(stripped)
        elif stripped.startswith("all_:"):
            m = re.search(r'all_:\s*(.*?),\\', stripped)
            addtion_all = m.group(1) if m else ""
        elif stripped.startswith("first_:"):
            m = re.search(r'first_:\s*(.*?),\\', stripped)
            addtion_first = m.group(1) if m else ""
        elif stripped.startswith("recipe_sum_all:"):
            m = re.search(r'recipe_sum_all:\s*(\[[^\]]*\])', stripped)
            recipe_sum_all = m.group(1) if m else ""
        elif stripped.startswith("recipe_sum_first:"):
            m = re.search(r'recipe_sum_first:\s*(\[[^\]]*\])', stripped)
            recipe_sum_first = m.group(1) if m else ""
    if addtion_all != "":
        addtion_all = addtion_all[1:-1]
    if addtion_first != "":
        addtion_first = addtion_first[1:-1]
    return all_emerald, all_score, first_emerald, first_score, addtion_all, addtion_first, recipe_sum_all, recipe_sum_first

def get_reward_values(line:str) -> tuple[int, int]:
    m_emerald = re.search(r'emerald\s*:\s*(\d+)', line)
    m_score   = re.search(r'score\s*:\s*(\d+)', line)

    emerald = int(m_emerald.group(1)) if m_emerald else 0
    score   = int(m_score.group(1))   if m_score   else 0

    return emerald, score