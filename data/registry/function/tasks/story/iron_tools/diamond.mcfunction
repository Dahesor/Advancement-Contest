data modify storage dsc:task new append value {\
    advancement:"dsc_adv:story/mine_diamond",\
    all_reward:{emerald:5,score:5,recipe:"dsc_recipe:story/adv/diamond"},\
    first_reward:{emerald:10,score:10,recipe:"dsc_recipe:story/adv/diamond_first"},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"钻石镐\n床\n磁石",\
        recipe_sum_first:"金苹果\n钓鱼竿\n指南针\n风弹",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"diamond",\
    display:{\
        title:{"translate":"task.diamond","italic":false},\
        lore:[{"translate":"task.diamond.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["5"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"钻石镐\n床\n磁石","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["10"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["10"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"金苹果\n钓鱼竿\n指南针\n风弹","italic":false,"color":"gray"}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:diamond/give",\
        take:"dsc_recipe:diamond/take",\
        give_first:"dsc_recipe:diamond_first/give",\
        take_first:"dsc_recipe:diamond_first/take",\
    }\
}