data modify storage dsc:task new append value {\
    advancement:"dsc_adv:story/deflect_arrow",\
    all_reward:{emerald:6,score:4,recipe:"dsc_recipe:block_arrow_first"},\
    first_reward:{emerald:0,score:10,recipe:"dsc_recipe:block_arrow_first"},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"箭矢",\
        recipe_sum_first:"发射器",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"block_arrow",\
    display:{\
        title:{"translate":"task.block_arrow","italic":false},\
        lore:[{"translate":"task.block_arrow.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["6"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"箭矢","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["10"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"发射器","italic":false,"color":"gray"}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:block_arrow_first/give",\
        take:"dsc_recipe:block_arrow_first/take",\
        give_first:"dsc_recipe:block_arrow_first/give",\
        take_first:"dsc_recipe:block_arrow_first/take",\
    }\
}