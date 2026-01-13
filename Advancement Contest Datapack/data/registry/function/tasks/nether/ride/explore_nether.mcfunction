data modify storage dsc:task new append value {\
    advancement:"dsc_adv:nether/explore_nether",\
    all_reward:{emerald:5,score:8,recipe:"dsc_recipe:nether/challenge/all_biome_nether"},\
    first_reward:{emerald:0,score:16},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"重生锚",\
        recipe_sum_first:"",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"explore_nether",\
    display:{\
        title:{"translate":"task.explore_nether","italic":false},\
        lore:[{"translate":"task.explore_nether.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["8"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["5"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"重生锚","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["16"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:all_biome_nether/give",\
        take:"dsc_recipe:all_biome_nether/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}