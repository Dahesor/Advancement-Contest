data modify storage dsc:task new append value {\
    advancement:"dsc_adv:husbandry/make_a_sign_glow",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:husbandry/sign/glow_sign"},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"玻璃板，玻璃瓶\n剪刀\n篝火，灵魂篝火",\
        recipe_sum_first:"",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"make_a_sign_glow",\
    display:{\
        title:{"translate":"task.make_a_sign_glow","italic":false},\
        lore:[{"translate":"task.make_a_sign_glow.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"玻璃板，玻璃瓶\n剪刀\n篝火，灵魂篝火","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:glow_sign/give",\
        take:"dsc_recipe:glow_sign/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}