data modify storage dsc:task new append value {\
    advancement:"dsc_adv:adventure/voluntary_exile",\
    all_reward:{emerald:2,score:4},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:2},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"",\
        recipe_sum_first:"",\
    },\
    node:{node:"node",children:["dsc_adv:adventure/hero_of_the_village","dsc_adv:adventure/totem_of_undying"]}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"voluntary_exile",\
    display:{\
        title:{"translate":"task.voluntary_exile","italic":false},\
        lore:[{"translate":"task.voluntary_exile.1","italic":false,"color":"gray"}, "\n", {"translate":"task.voluntary_exile.2","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
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