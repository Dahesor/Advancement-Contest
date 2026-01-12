data modify storage dsc:task new append value {\
    advancement:"dsc_adv:story/enter_the_nether",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:story/adv/enter_nether"},\
    first_reward:{emerald:4,score:5,recipe:"dsc_recipe:story/adv/enter_nether_first"},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"指南针，时钟",\
        recipe_sum_first:"火焰弹，发射器",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"enter_the_nether",\
    display:{\
        title:{"translate":"task.enter_the_nether","italic":false},\
        lore:[{"translate":"task.enter_the_nether.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"指南针，时钟","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"火焰弹，发射器","italic":false,"color":"gray"}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:enter_nether/give",\
        take:"dsc_recipe:enter_nether/take",\
        give_first:"dsc_recipe:enter_nether_first/give",\
        take_first:"dsc_recipe:enter_nether_first/take",\
    }\
}