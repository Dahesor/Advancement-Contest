data modify storage dsc:task new append value {\
    advancement:"dsc_adv:adventure/avoid_vibration",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:adventure/deep/avoid_vibration"},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:3},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["stone_spear"],\
        recipe_sum_first:[],\
    },node:{children:["dsc_adv:adventure/catalize_sculk","dsc_adv:adventure/hurt_warden"],node:"conditional"}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"avoid_vibration",\
    display:{\
        title:{"translate":"task.avoid_vibration","italic":false},\
        lore:[{"translate":"task.avoid_vibration.1","italic":false,"color":"gray"}, "\n", {"translate":"task.avoid_vibration.2","italic":false,"color":"gray"}, "\n", {"translate":"task.avoid_vibration.3","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.stone_spear", "extra": ["-"], "fallback": ""}], "\n", "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:avoid_vibration/give",\
        take:"dsc_recipe:avoid_vibration/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}