data modify storage dsc:task new append value {\
    advancement:"dsc_adv:nether/distract_piglin",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:nether/bastion/distract_piglin"},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"金粒，金锭，与金块转换",\
        recipe_sum_first:"",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"distract_piglin",\
    display:{\
        title:{"translate":"task.distract_piglin","italic":false},\
        lore:[{"translate":"task.distract_piglin.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"金粒，金锭，与金块转换","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:distract_piglin/give",\
        take:"dsc_recipe:distract_piglin/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}