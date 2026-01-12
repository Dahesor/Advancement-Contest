from pathlib import Path
from registry.recipe_tag import *
from registry.display_recipe import *
from registry.lang import *
from registry.recipe_func import *
from registry.build_description import *
from adv_.duplicate import *
from adv_.insert_display import *
from adv_.expand_path import *

Source = "./data/registry/function/tasks/"
LanguageFileRecipe = "../../../../resourcepacks/Survival Competition Resources/lang/assets/recipe/lang/zh_cn.json"
LanguageFileTask = "../../../../resourcepacks/Survival Competition Resources/lang/assets/task/lang/zh_cn.json"
RECEIVER_FUNCTION_DIR = (Path.cwd() / "./data/dsc_adv/function/").resolve()
DEFAULT_TEXT_FORMAT = {"text": "","color":"gray","italic":False}

def parse_registry(registry, LANGUAGE_DIR, LANGUAGE_DIR_TASK):
    task_trans_list, lore_text, title_text, reg_id = insert_id(registry)
    lore_text = description(registry, lore_text)
    full_adv_path = expand_advancement(registry,)
    assert full_adv_path is not None, f"Advancement path not found"
    insert_display(full_adv_path, lore_text, title_text, reg_id, RECEIVER_FUNCTION_DIR)
    duplicate_adv(full_adv_path)

    trans_list = None
    trans_list_2 = None
    result_text = "[]"
    result_text_2 = "[]"

    path, namespace, recipe_file_name = get_recipe_tag(registry=registry, lookfor="all_reward")
    if path is not None and namespace is not None:
        result_text, trans_list = read_recipe_tag(path, DEFAULT_TEXT_FORMAT)
        write_recipe_func(registry, recipe_file_name, "")

    path, namespace, recipe_file_name = get_recipe_tag(registry=registry, lookfor="first_reward")
    if path is not None and namespace is not None:
        result_text_2, trans_list_2 = read_recipe_tag(path, DEFAULT_TEXT_FORMAT)
        write_recipe_func(registry, recipe_file_name, "_first")

    final_keys = list(set(trans_list or []) | set(trans_list_2 or []))
    write_recipe_display(registry, result_text, result_text_2)
    insert_trans_key(LANGUAGE_DIR, final_keys)
    insert_trans_key(LANGUAGE_DIR_TASK, task_trans_list)

def main():
    SOURCE_DIR = (Path.cwd() / Source).resolve()   # 源文件夹
    LANGUAGE_DIR_RECIPE = (Path.cwd() / LanguageFileRecipe).resolve()   # 配方
    LANGUAGE_DIR_TASK = (Path.cwd() / LanguageFileTask).resolve()   # 进度

    pattern = "**/*.mcfunction"
    registry_files = sorted(SOURCE_DIR.glob(pattern))

    for file in registry_files:
        parse_registry(file, LANGUAGE_DIR_RECIPE, LANGUAGE_DIR_TASK)



if __name__ == "__main__":
    main()