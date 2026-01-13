data modify storage dsc:task new append value {\
    advancement:"dsc_adv:adventure/trim_with_all",\
    all_reward:{emerald:0,score:30},\
    first_reward:{emerald:64,score:30},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"",\
        recipe_sum_first:"",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"trim_with_all",\
    display:{\
        title:{"translate":"task.trim_with_all","italic":false},\
        lore:[{"translate":"task.trim_with_all.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["30"]}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["30"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["64"]}],\
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