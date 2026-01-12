data modify storage dsc:task new append value {\
    advancement:"dsc_adv:story/make_crafting_table",\
    all_reward:{emerald:0,score:0,recipe:"dsc_recipe:story/crafting_table"},\
    first_reward:{emerald:0,score:10},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"木质工具，皮革铠甲\n熔炉\n木桶\n梯子",\
        recipe_sum_first:"",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"get_crafting_table",\
    display:{\
        title:{"translate":"task.get_crafting_table","italic":false},\
        lore:[{"translate":"task.get_crafting_table.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"木质工具，皮革铠甲\n熔炉\n木桶\n梯子","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["10"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:crafting_table/give",\
        take:"dsc_recipe:crafting_table/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}