data modify storage dsc:task new append value {\
    advancement:"dsc_adv:adventure/spyglass_at_ghast",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:adventure/spyglass/spy_at_ghast"},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["oak_boat","oak_chest_boat","bamboo_raft","bamboo_chest_raft"],\
        recipe_sum_first:[],\
    },node:{node:"node",children:["dsc_adv:husbandry/boat_with_goat"]}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"spyglass_at_ghast",\
    display:{\
        title:{"translate":"task.spyglass_at_ghast","italic":false},\
        lore:[{"translate":"task.spyglass_at_ghast.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.oak_boat", "extra": ["-"], "fallback": ""}, {"translate": "si.oak_chest_boat", "extra": ["-"], "fallback": ""}, {"translate": "si.bamboo_raft", "extra": ["-"], "fallback": ""}, {"translate": "si.bamboo_chest_raft", "extra": ["-"], "fallback": ""}], "\n", "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:spy_at_ghast/give",\
        take:"dsc_recipe:spy_at_ghast/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}