from recipe import main as make_recipe_functions
from registry.read_files import main as read_reg_files
from registry.update_tag import main as update_tags
from recipe_.port_recipe_to_lang import main as port_recipe
from recipe_.make_icons import main as make_icons

if __name__ == "__main__":
    make_recipe_functions()
    read_reg_files()
    update_tags()
    port_recipe()
    make_icons()