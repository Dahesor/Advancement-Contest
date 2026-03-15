data modify storage dsc:task new append value {\
    advancement:"dsc_adv:husbandry/silk_touch_nest",\
    all_reward:{emerald:4,score:2,recipe:"dsc_recipe:husbandry/sign/silk_touch_nest"},\
    first_reward:{emerald:0,score:8},\
    display:{lore_length:2},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["iron_spear"],\
        recipe_sum_first:[],\
    },node:{node:"node"}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"silk_touch_nest",\
    display:{\
        title:{"translate":"task.silk_touch_nest","italic":false},\
        lore:[{"translate":"task.silk_touch_nest.1","italic":false,"color":"gray"}, "\n", {"translate":"task.silk_touch_nest.2","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["2"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.iron_spear", "extra": ["-"], "fallback": ""}], "\n", "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["8"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:silk_touch_nest/give",\
        take:"dsc_recipe:silk_touch_nest/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}