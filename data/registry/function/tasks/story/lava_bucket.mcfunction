data modify storage dsc:task new append value {\
    advancement:"dsc_adv:story/lava_bucket",\
    all_reward:{emerald:0,score:3,recipe:"dsc_recipe:lava_bucket"},\
    first_reward:{emerald:0,score:6,recipe:"dsc_recipe:first_lava_bucket"},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"金靴子",\
        recipe_sum_first:"金头盔",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"lava_bucket",\
    display:{\
        title:{"translate":"task.lava_bucket","italic":false},\
        lore:[{"translate":"task.lava_bucket.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["3"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"金靴子","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["6"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"金头盔","italic":false,"color":"gray"}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:lava_bucket/give",\
        take:"dsc_recipe:lava_bucket/take",\
        give_first:"dsc_recipe:first_lava_bucket/give",\
        take_first:"dsc_recipe:first_lava_bucket/take",\
    }\
}