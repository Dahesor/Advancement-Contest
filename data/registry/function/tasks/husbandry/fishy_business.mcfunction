data modify storage dsc:task new append value {\
    advancement:"dsc_adv:husbandry/fishy_business",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:husbandry/fish/fishy_bus"},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"桶",\
        recipe_sum_first:"",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"fishy_business",\
    display:{\
        title:{"translate":"task.fishy_business","italic":false},\
        lore:[{"translate":"task.fishy_business.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"桶","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:fishy_bus/give",\
        take:"dsc_recipe:fishy_bus/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}