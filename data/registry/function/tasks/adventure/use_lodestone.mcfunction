data modify storage dsc:task new append value {\
    advancement:"dsc_adv:adventure/use_lodestone",\
    all_reward:{emerald:2,score:4},\
    first_reward:{emerald:4,score:5,recipe:"dsc_recipe:adventure/trial/lodestone_first"},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"",\
        recipe_sum_first:"雕纹书架",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"use_lodestone",\
    display:{\
        title:{"translate":"task.use_lodestone","italic":false},\
        lore:[{"translate":"task.use_lodestone.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"雕纹书架","italic":false,"color":"gray"}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"registry:null",\
        take:"registry:null",\
        give_first:"dsc_recipe:lodestone_first/give",\
        take_first:"dsc_recipe:lodestone_first/take",\
    }\
}