data modify storage dsc:task new append value {\
    advancement:"dsc_adv:story/upgrade_tools",\
    all_reward:{emerald:0,score:0,recipe:"dsc_recipe:story/stone_pickaxe"},\
    first_reward:{emerald:0,score:2},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"铁质与铜制工具\n桶\n盾牌",\
        recipe_sum_first:"",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"stone_pickaxe",\
    display:{\
        title:{"translate":"task.stone_pickaxe","italic":false},\
        lore:[{"translate":"task.stone_pickaxe.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"铁质与铜制工具\n桶\n盾牌","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["2"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:stone_pickaxe/give",\
        take:"dsc_recipe:stone_pickaxe/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}