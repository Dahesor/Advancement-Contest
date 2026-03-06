data modify storage dsc:task new append value {\
    advancement:"dsc_adv:husbandry/allay_deliver_cake",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:husbandry/allay/cake"},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:2},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["calibrated_sculk_sensor","comparator"],\
        recipe_sum_first:[],\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"allay_deliver_cake",\
    display:{\
        title:{"translate":"task.allay_deliver_cake","italic":false},\
        lore:[{"translate":"task.allay_deliver_cake.1","italic":false,"color":"gray"}, "\n", {"translate":"task.allay_deliver_cake.2","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.calibrated_sculk_sensor", "extra": ["-"], "fallback": ""}, {"translate": "si.comparator", "extra": ["-"], "fallback": ""}], "\n", "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:cake/give",\
        take:"dsc_recipe:cake/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}