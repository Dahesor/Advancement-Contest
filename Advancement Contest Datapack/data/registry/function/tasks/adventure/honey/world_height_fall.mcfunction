data modify storage dsc:task new append value {\
    advancement:"dsc_adv:adventure/world_height_fall",\
    all_reward:{emerald:2,score:10,recipe:"dsc_recipe:adventure/caves_cliff"},\
    first_reward:{emerald:4,score:10},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"书架，雕纹书架",\
        recipe_sum_first:"",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"world_height_fall",\
    display:{\
        title:{"translate":"task.world_height_fall","italic":false},\
        lore:[{"translate":"task.world_height_fall.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["10"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"书架，雕纹书架","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["10"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:caves_cliff/give",\
        take:"dsc_recipe:caves_cliff/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}