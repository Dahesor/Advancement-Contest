data modify storage dsc:task new append value {\
    advancement:"dsc_adv:end/kill_dragon",\
    all_reward:{emerald:5,score:10,recipe:"dsc_recipe:end/slay_dragon"},\
    first_reward:{emerald:5,score:0},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"末地水晶",\
        recipe_sum_first:"",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"kill_dragon",\
    display:{\
        title:{"translate":"task.kill_dragon","italic":false},\
        lore:[{"translate":"task.kill_dragon.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["10"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["5"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"末地水晶","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["5"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:slay_dragon/give",\
        take:"dsc_recipe:slay_dragon/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}