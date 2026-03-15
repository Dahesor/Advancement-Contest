data modify storage dsc:task new append value {\
    advancement:"dsc_adv:adventure/bullseye",\
    all_reward:{emerald:2,score:5,recipe:"dsc_recipe:adventure/kill_mob/bullseye"},\
    first_reward:{emerald:4,score:6},\
    display:{lore_length:2},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["crossbow"],\
        recipe_sum_first:[],\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"bullseye",\
    display:{\
        title:{"translate":"task.bullseye","italic":false},\
        lore:[{"translate":"task.bullseye.1","italic":false,"color":"gray"}, "\n", {"translate":"task.bullseye.2","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.crossbow", "extra": ["-"], "fallback": ""}], "\n", "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["6"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:bullseye/give",\
        take:"dsc_recipe:bullseye/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}