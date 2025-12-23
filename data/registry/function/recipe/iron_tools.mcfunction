data modify storage dsc:task new append value {\
    advancement:"dsc_adv:story/iron_tools",\
    all_reward:{emerald:2,score:2},\
    first_reward:{emerald:1,score:1,recipe:"dsc_recipe:refined_iron_tools"},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"",\
        recipe_sum_first:"精良的铁质工具",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"iron_tools",\
    display:{\
        title:{"translate":"task.iron_tools","italic":false},\
        lore:[{"translate":"task.iron_tools.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["2"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["1"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["1"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"精良的铁质工具","italic":false,"color":"gray"}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"registry:null",\
        take:"registry:null",\
        give_first:"dsc_recipe:refined_iron_tools/give",\
        take_first:"dsc_recipe:refined_iron_tools/take",\
    }\
}