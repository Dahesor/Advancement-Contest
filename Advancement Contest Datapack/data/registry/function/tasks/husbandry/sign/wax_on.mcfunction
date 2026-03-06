data modify storage dsc:task new append value {\
    advancement:"dsc_adv:husbandry/wax_on",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:husbandry/sign/wax_on"},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["brush"],\
        recipe_sum_first:[],\
    },node:{children:["dsc_adv:adventure/brush_armadillo","dsc_adv:adventure/salvage_sherd"],node:"node"}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"wax_on",\
    display:{\
        title:{"translate":"task.wax_on","italic":false},\
        lore:[{"translate":"task.wax_on.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.brush", "extra": ["-"], "fallback": ""}], "\n", "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:wax_on/give",\
        take:"dsc_recipe:wax_on/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}