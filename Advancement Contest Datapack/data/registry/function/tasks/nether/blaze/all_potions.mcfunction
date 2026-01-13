data modify storage dsc:task new append value {\
    advancement:"dsc_adv:nether/all_potions",\
    all_reward:{emerald:24,score:20},\
    first_reward:{emerald:0,score:20},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"",\
        recipe_sum_first:"",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"all_potions",\
    display:{\
        title:{"translate":"task.all_potions","italic":false},\
        lore:[{"translate":"task.all_potions.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["20"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["24"]}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["20"]}],\
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