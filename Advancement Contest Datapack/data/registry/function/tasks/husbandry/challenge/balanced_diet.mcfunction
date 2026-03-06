data modify storage dsc:task new append value {\
    advancement:"dsc_adv:husbandry/balanced_diet",\
    all_reward:{emerald:10,score:20,recipe:"dsc_recipe:husbandry/balanced_diet"},\
    first_reward:{emerald:20,score:30,recipe:"dsc_recipe:husbandry/balanced_diet_first"},\
    display:{lore_length:2},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["totem_of_undying"],\
        recipe_sum_first:["glistering_melon_slice"],\
    },node:{children:["dsc_adv:adventure/totem_of_undying"],node:"challenge"}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"balanced_diet",\
    display:{\
        title:{"translate":"task.balanced_diet","italic":false},\
        lore:[{"translate":"task.balanced_diet.1","italic":false,"color":"gray"}, "\n", {"translate":"task.balanced_diet.2","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["20"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["10"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.totem_of_undying", "extra": ["-"], "fallback": ""}], "\n", "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["30"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["20"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.glistering_melon_slice", "extra": ["-"], "fallback": ""}], "\n"],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:balanced_diet/give",\
        take:"dsc_recipe:balanced_diet/take",\
        give_first:"dsc_recipe:balanced_diet_first/give",\
        take_first:"dsc_recipe:balanced_diet_first/take",\
    }\
}