data modify storage dsc:task new append value {\
    advancement:"dsc_adv:adventure/shoot_arrow",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:adventure/kill_mob/shoot_arrow"},\
    first_reward:{emerald:4,score:5,recipe:"dsc_recipe:adventure/kill_mob/shoot_arrow_first"},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"箭矢，标靶",\
        recipe_sum_first:"精良弓",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"shoot_arrow",\
    display:{\
        title:{"translate":"task.shoot_arrow","italic":false},\
        lore:[{"translate":"task.shoot_arrow.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"箭矢，标靶","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"精良弓","italic":false,"color":"gray"}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:shoot_arrow/give",\
        take:"dsc_recipe:shoot_arrow/take",\
        give_first:"dsc_recipe:shoot_arrow_first/give",\
        take_first:"dsc_recipe:shoot_arrow_first/take",\
    }\
}