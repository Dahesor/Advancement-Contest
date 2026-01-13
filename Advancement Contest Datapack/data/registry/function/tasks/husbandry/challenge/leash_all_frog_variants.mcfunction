data modify storage dsc:task new append value {\
    advancement:"dsc_adv:husbandry/leash_all_frog_variants",\
    all_reward:{emerald:5,score:15},\
    first_reward:{emerald:10,score:15},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"",\
        recipe_sum_first:"",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"leash_all_frog_variants",\
    display:{\
        title:{"translate":"task.leash_all_frog_variants","italic":false},\
        lore:[{"translate":"task.leash_all_frog_variants.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["15"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["5"]}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["15"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["10"]}],\
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