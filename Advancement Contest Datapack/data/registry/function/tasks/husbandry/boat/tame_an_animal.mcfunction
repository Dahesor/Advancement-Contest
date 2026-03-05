data modify storage dsc:task new append value {\
    advancement:"dsc_adv:husbandry/tame_an_animal",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:husbandry/boat/tame_animal"},\
    first_reward:{emerald:4,score:5,recipe:"dsc_recipe:husbandry/boat/tame_animal_first"},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["carrot_on_a_stick","warped_fungus_on_a_stick","compass"],\
        recipe_sum_first:["shears","saddle"],\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"tame_an_animal",\
    display:{\
        title:{"translate":"task.tame_an_animal","italic":false},\
        lore:[{"translate":"task.tame_an_animal.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", [{"text": "", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.carrot_on_a_stick", "extra": ["-"]}, {"translate": "si.warped_fungus_on_a_stick", "extra": ["-"]}, {"translate": "si.compass", "extra": ["-"]}], "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", [{"text": "", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.shears", "extra": ["-"]}, {"translate": "si.saddle", "extra": ["-"]}]],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:tame_animal/give",\
        take:"dsc_recipe:tame_animal/take",\
        give_first:"dsc_recipe:tame_animal_first/give",\
        take_first:"dsc_recipe:tame_animal_first/take",\
    }\
}