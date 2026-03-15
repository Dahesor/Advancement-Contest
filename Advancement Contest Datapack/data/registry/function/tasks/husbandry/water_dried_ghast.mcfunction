data modify storage dsc:task new append value {\
    advancement:"dsc_adv:husbandry/water_dried_ghast",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:husbandry/water_ghast"},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:2},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["white_harness","red_harness","blue_harness","yellow_harness","green_harness"],\
        recipe_sum_first:[],\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"water_dried_ghast",\
    display:{\
        title:{"translate":"task.water_dried_ghast","italic":false},\
        lore:[{"translate":"task.water_dried_ghast.1","italic":false,"color":"gray"}, "\n", {"translate":"task.water_dried_ghast.2","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.white_harness", "extra": ["-"], "fallback": ""}, {"translate": "si.red_harness", "extra": ["-"], "fallback": ""}, {"translate": "si.blue_harness", "extra": ["-"], "fallback": ""}, {"translate": "si.yellow_harness", "extra": ["-"], "fallback": ""}, {"translate": "si.green_harness", "extra": ["-"], "fallback": ""}], "\n", "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:water_ghast/give",\
        take:"dsc_recipe:water_ghast/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}