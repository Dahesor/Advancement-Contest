from recipe import main as make_recipe_functions
from registry.read_files import main as read_reg_files
from registry.update_tag import main as update_tags

if __name__ == "__main__":
    make_recipe_functions()
    read_reg_files()
    update_tags()