data modify storage dsc:task new append value {\
    advancement:"dsc_adv:adventure/revaulting",\
    all_reward:{emerald:2,score:10,recipe:"dsc_recipe:adventure/trial/open_good_vault"},\
    first_reward:{emerald:4,score:10},\
    display:{lore_length:2},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["mace"],\
        recipe_sum_first:[],\
    },\
    node:{node:"node",children:["dsc_adv:adventure/overoverkill"]}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"revaulting",\
    display:{\
        title:{"translate":"task.revaulting","italic":false},\
        lore:[{"translate":"task.revaulting.1","italic":false,"color":"gray"}, "\n", {"translate":"task.revaulting.2","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["10"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.mace", "extra": ["-"], "fallback": ""}], "\n", "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["10"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:open_good_vault/give",\
        take:"dsc_recipe:open_good_vault/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}