data modify storage dsc:task new append value {\
    advancement:"dsc_adv:adventure/chiseled_bookshelf",\
    all_reward:{emerald:2,score:7,recipe:"dsc_recipe:adventure/bookshelf"},\
    first_reward:{emerald:3,score:5},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"刷子",\
        recipe_sum_first:"",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"chiseled_bookshelf",\
    display:{\
        title:{"translate":"task.chiseled_bookshelf","italic":false},\
        lore:[{"translate":"task.chiseled_bookshelf.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["7"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"刷子","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["3"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:bookshelf/give",\
        take:"dsc_recipe:bookshelf/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}