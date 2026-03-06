data modify storage dsc:task new append value {\
    advancement:"dsc_adv:adventure/honey_block_slide",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:adventure/misc/honey_block"},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:2},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["honey_block","slime_block","sticky_piston","observer"],\
        recipe_sum_first:[],\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"honey_block_slide",\
    display:{\
        title:{"translate":"task.honey_block_slide","italic":false},\
        lore:[{"translate":"task.honey_block_slide.1","italic":false,"color":"gray"}, "\n", {"translate":"task.honey_block_slide.2","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.honey_block", "extra": ["-"], "fallback": ""}, {"translate": "si.slime_block", "extra": ["-"], "fallback": ""}, {"translate": "si.sticky_piston", "extra": ["-"], "fallback": ""}, {"translate": "si.observer", "extra": ["-"], "fallback": ""}], "\n", "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:honey_block/give",\
        take:"dsc_recipe:honey_block/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}