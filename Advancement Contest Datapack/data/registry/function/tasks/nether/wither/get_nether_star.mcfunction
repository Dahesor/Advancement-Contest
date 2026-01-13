data modify storage dsc:task new append value {\
    advancement:"dsc_adv:nether/get_nether_star",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:nether/fortress/kill_wither"},\
    first_reward:{emerald:4,score:20},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"钻石胸甲\n钻石长矛",\
        recipe_sum_first:"",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"get_nether_star",\
    display:{\
        title:{"translate":"task.get_nether_star","italic":false},\
        lore:[{"translate":"task.get_nether_star.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"钻石胸甲\n钻石长矛","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["20"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:kill_wither/give",\
        take:"dsc_recipe:kill_wither/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}