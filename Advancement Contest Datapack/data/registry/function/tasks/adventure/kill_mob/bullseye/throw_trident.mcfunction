data modify storage dsc:task new append value {\
    advancement:"dsc_adv:adventure/throw_trident",\
    all_reward:{emerald:2,score:8,recipe:"dsc_recipe:adventure/trident/throw_trident"},\
    first_reward:{emerald:4,score:8},\
    display:{lore_length:2},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["copper_bars","copper_chain","lightning_rod","turtle_helmet"],\
        recipe_sum_first:[],\
    },\
    node:{node:"node",children:["dsc_adv:adventure/very_frightening","dsc_adv:adventure/lightning_rod"]}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"throw_trident",\
    display:{\
        title:{"translate":"task.throw_trident","italic":false},\
        lore:[{"translate":"task.throw_trident.1","italic":false,"color":"gray"}, "\n", {"translate":"task.throw_trident.2","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["8"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.copper_bars", "extra": ["-"], "fallback": ""}, {"translate": "si.copper_chain", "extra": ["-"], "fallback": ""}, {"translate": "si.lightning_rod", "extra": ["-"], "fallback": ""}, {"translate": "si.turtle_helmet", "extra": ["-"], "fallback": ""}], "\n", "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["8"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:throw_trident/give",\
        take:"dsc_recipe:throw_trident/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}