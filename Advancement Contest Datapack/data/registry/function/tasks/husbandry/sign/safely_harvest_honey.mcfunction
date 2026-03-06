data modify storage dsc:task new append value {\
    advancement:"dsc_adv:husbandry/safely_harvest_honey",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:husbandry/sign/harvest_honey"},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:3},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["honey_block","honey_bottle","honeycomb_block","sugar"],\
        recipe_sum_first:[],\
    },\
    node:{node:"node",children:["dsc_adv:adventure/honey_block_slide","dsc_adv:husbandry/wax_on","dsc_adv:husbandry/silk_touch_nest"]}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"safely_harvest_honey",\
    display:{\
        title:{"translate":"task.safely_harvest_honey","italic":false},\
        lore:[{"translate":"task.safely_harvest_honey.1","italic":false,"color":"gray"}, "\n", {"translate":"task.safely_harvest_honey.2","italic":false,"color":"gray"}, "\n", {"translate":"task.safely_harvest_honey.3","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.honey_block", "extra": ["-"], "fallback": ""}, {"translate": "si.honey_bottle", "extra": ["-"], "fallback": ""}, {"translate": "si.honeycomb_block", "extra": ["-"], "fallback": ""}, {"translate": "si.sugar", "extra": ["-"], "fallback": ""}], "\n", "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:harvest_honey/give",\
        take:"dsc_recipe:harvest_honey/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}