data modify storage dsc:task new append value {\
    advancement:"dsc_adv:nether/ride_strider",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:nether/ride/strider_nether"},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:2},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"骨粉（骨块合成）",\
        recipe_sum_first:"",\
    },\
    node:{node:"node",children:["dsc_adv:nether/strider_overworld_lava"]}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"ride_strider",\
    display:{\
        title:{"translate":"task.ride_strider","italic":false},\
        lore:[{"translate":"task.ride_strider.1","italic":false,"color":"gray"}, "\n", {"translate":"task.ride_strider.2","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"骨粉（骨块合成）","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:strider_nether/give",\
        take:"dsc_recipe:strider_nether/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}