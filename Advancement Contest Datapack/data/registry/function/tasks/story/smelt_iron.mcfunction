data modify storage dsc:task new append value {\
    advancement:"dsc_adv:story/smelt_iron",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:story/iron_smelt"},\
    first_reward:{emerald:2,score:5,recipe:"dsc_recipe:story/first_iron_smelt"},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["chainmail_boots","chainmail_leggings"],\
        recipe_sum_first:["blast_furnace","smoker","fletching_table","cauldron","stonecutter"],\
    },\
    node:{node:"node",default_pin:true,children:["dsc_adv:story/iron_tools","dsc_adv:story/obtain_armor","dsc_adv:story/lava_bucket"]}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"smelt_iron",\
    display:{\
        title:{"translate":"task.smelt_iron","italic":false},\
        lore:[{"translate":"task.smelt_iron.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.chainmail_boots", "extra": ["-"], "fallback": ""}, {"translate": "si.chainmail_leggings", "extra": ["-"], "fallback": ""}], "\n", "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.blast_furnace", "extra": ["-"], "fallback": ""}, {"translate": "si.smoker", "extra": ["-"], "fallback": ""}, {"translate": "si.fletching_table", "extra": ["-"], "fallback": ""}, {"translate": "si.cauldron", "extra": ["-"], "fallback": ""}, {"translate": "si.stonecutter", "extra": ["-"], "fallback": ""}], "\n"],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:iron_smelt/give",\
        take:"dsc_recipe:iron_smelt/take",\
        give_first:"dsc_recipe:first_iron_smelt/give",\
        take_first:"dsc_recipe:first_iron_smelt/take",\
    }\
}