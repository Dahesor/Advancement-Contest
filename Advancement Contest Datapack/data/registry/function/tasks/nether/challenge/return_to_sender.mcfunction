data modify storage dsc:task new append value {\
    advancement:"dsc_adv:nether/return_to_sender",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:nether/challenge/return_to_sender"},\
    first_reward:{emerald:4,score:7},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"火焰弹\n发射器，投掷器",\
        recipe_sum_first:"",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"return_to_sender",\
    display:{\
        title:{"translate":"task.return_to_sender","italic":false},\
        lore:[{"translate":"task.return_to_sender.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"火焰弹\n发射器，投掷器","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["7"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:return_to_sender/give",\
        take:"dsc_recipe:return_to_sender/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}