data modify storage dsc:task new append value {\
    advancement:"dsc_adv:story/obtain_armor",\
    all_reward:{emerald:2,score:5,recipe:"dsc_recipe:story/iron_armor"},\
    first_reward:{emerald:0,score:6,recipe:"dsc_recipe:story/first_iron_armor"},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["iron_chestplate","iron_leggings","iron_boots"],\
        recipe_sum_first:["iron_helmet"],\
    },\
    node:{node:"node",children:["dsc_adv:story/deflect_arrow"]}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"obtain_armor",\
    display:{\
        title:{"translate":"task.obtain_armor","italic":false},\
        lore:[{"translate":"task.obtain_armor.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.iron_chestplate", "extra": ["-"], "fallback": ""}, {"translate": "si.iron_leggings", "extra": ["-"], "fallback": ""}, {"translate": "si.iron_boots", "extra": ["-"], "fallback": ""}], "\n", "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["6"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.iron_helmet", "extra": ["-"], "fallback": ""}], "\n"],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:iron_armor/give",\
        take:"dsc_recipe:iron_armor/take",\
        give_first:"dsc_recipe:first_iron_armor/give",\
        take_first:"dsc_recipe:first_iron_armor/take",\
    }\
}