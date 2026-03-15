data modify storage dsc:task new append value {\
    advancement:"dsc_adv:adventure/sleep_in_bed",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:adventure/sleep_in_bed"},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:2},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["spyglass","fishing_rod","bowl"],\
        recipe_sum_first:[],\
    },node:{default_pin:true,node:"node",children:["dsc_adv:adventure/spyglass_at_parrot","dsc_adv:husbandry/fishy_business"]}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"sleep_in_bed",\
    display:{\
        title:{"translate":"task.sleep_in_bed","italic":false},\
        lore:[{"translate":"task.sleep_in_bed.1","italic":false,"color":"gray"}, "\n", {"translate":"task.sleep_in_bed.2","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.spyglass", "extra": ["-"], "fallback": ""}, {"translate": "si.fishing_rod", "extra": ["-"], "fallback": ""}, {"translate": "si.bowl", "extra": ["-"], "fallback": ""}], "\n", "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:sleep_in_bed/give",\
        take:"dsc_recipe:sleep_in_bed/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}