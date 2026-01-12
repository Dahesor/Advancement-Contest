data modify storage dsc:task new append value {\
    advancement:"dsc_adv:husbandry/obtain_netherite_hoe",\
    all_reward:{emerald:10,score:6},\
    first_reward:{emerald:20,score:20},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"",\
        recipe_sum_first:"",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"obtain_netherite_hoe",\
    display:{\
        title:{"translate":"task.obtain_netherite_hoe","italic":false},\
        lore:[{"translate":"task.obtain_netherite_hoe.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["6"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["10"]}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["20"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["20"]}],\
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