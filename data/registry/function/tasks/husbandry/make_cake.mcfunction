data modify storage dsc:task new append value {\
    advancement:"dsc_adv:husbandry/make_cake",\
    all_reward:{emerald:5,score:6,recipe:"dsc_recipe:husbandry/make_cake"},\
    first_reward:{emerald:8,score:8,recipe:"dsc_recipe:husbandry/make_cake_first"},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"金胡萝卜，金苹果\n酿造台",\
        recipe_sum_first:"附魔金苹果\n绊线钩",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"make_cake",\
    display:{\
        title:{"translate":"task.make_cake","italic":false},\
        lore:[{"translate":"task.make_cake.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["6"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["5"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"金胡萝卜，金苹果\n酿造台","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["8"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["8"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"附魔金苹果\n绊线钩","italic":false,"color":"gray"}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:make_cake/give",\
        take:"dsc_recipe:make_cake/take",\
        give_first:"dsc_recipe:make_cake_first/give",\
        take_first:"dsc_recipe:make_cake_first/take",\
    }\
}