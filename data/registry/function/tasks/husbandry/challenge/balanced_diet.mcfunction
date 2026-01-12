data modify storage dsc:task new append value {\
    advancement:"dsc_adv:husbandry/balanced_diet",\
    all_reward:{emerald:10,score:16,recipe:"dsc_recipe:balanced_diet"},\
    first_reward:{emerald:20,score:20,recipe:"dsc_recipe:balanced_diet_first"},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"不死图腾",\
        recipe_sum_first:"闪烁的西瓜",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"balanced_diet",\
    display:{\
        title:{"translate":"task.balanced_diet","italic":false},\
        lore:[{"translate":"task.balanced_diet.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["16"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["10"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"不死图腾","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["20"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["20"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"闪烁的西瓜","italic":false,"color":"gray"}],\
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