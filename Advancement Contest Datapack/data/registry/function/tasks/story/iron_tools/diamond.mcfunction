data modify storage dsc:task new append value {\
    advancement:"dsc_adv:story/mine_diamond",\
    all_reward:{emerald:5,score:5,recipe:"dsc_recipe:story/adv/diamond"},\
    first_reward:{emerald:10,score:10,recipe:"dsc_recipe:story/adv/diamond_first"},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["diamond_leggings","diamond_pickaxe","white_bed","lodestone"],\
        recipe_sum_first:["golden_apple","fishing_rod","compass_17","wind_charge"],\
    },\
    node:{node:"node",default_pin:true,children:["dsc_adv:story/shiny_gear","dsc_adv:adventure/use_lodestone","dsc_adv:husbandry/fishy_business","dsc_adv:story/cure_zombie_villager"]}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"diamond",\
    display:{\
        title:{"translate":"task.diamond","italic":false},\
        lore:[{"translate":"task.diamond.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["5"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.diamond_leggings", "extra": ["-"], "fallback": ""}, {"translate": "si.diamond_pickaxe", "extra": ["-"], "fallback": ""}, {"translate": "si.white_bed", "extra": ["-"], "fallback": ""}, {"translate": "si.lodestone", "extra": ["-"], "fallback": ""}], "\n", "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["10"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["10"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.golden_apple", "extra": ["-"], "fallback": ""}, {"translate": "si.fishing_rod", "extra": ["-"], "fallback": ""}, {"translate": "si.compass_17", "extra": ["-"], "fallback": ""}, {"translate": "si.wind_charge", "extra": ["-"], "fallback": ""}], "\n"],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:diamond/give",\
        take:"dsc_recipe:diamond/take",\
        give_first:"dsc_recipe:diamond_first/give",\
        take_first:"dsc_recipe:diamond_first/take",\
    }\
}