data modify storage dsc:task new append value {\
    advancement:"dsc_adv:adventure/spear_many_mobs",\
    all_reward:{emerald:0,score:8},\
    first_reward:{emerald:16,score:15},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"",\
        recipe_sum_first:"",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"spear_many_mobs",\
    display:{\
        title:{"translate":"task.spear_many_mobs","italic":false},\
        lore:[{"translate":"task.spear_many_mobs.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["8"]}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["15"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["16"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"registry:null",\
        take:"registry:null",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}