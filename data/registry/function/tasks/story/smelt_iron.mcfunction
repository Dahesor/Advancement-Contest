data modify storage dsc:task new append value {\
    advancement:"dsc_adv:story/smelt_iron",\
    all_reward:{emerald:5,score:5},\
    first_reward:{emerald:5,score:5,recipe:"dsc_recipe:story/first_iron_smelt"},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"",\
        recipe_sum_first:"高炉，烟熏炉，制箭台\n炼药锅\n切石机",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"smelt_iron",\
    display:{\
        title:{"translate":"task.smelt_iron","italic":false},\
        lore:[{"translate":"task.smelt_iron.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["5"]}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["5"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"高炉，烟熏炉，制箭台\n炼药锅\n切石机","italic":false,"color":"gray"}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"registry:null",\
        take:"registry:null",\
        give_first:"dsc_recipe:first_iron_smelt/give",\
        take_first:"dsc_recipe:first_iron_smelt/take",\
    }\
}