data modify storage dsc:task new append value {\
    advancement:"dsc_adv:adventure/hero_of_the_village",\
    all_reward:{emerald:2,score:10,recipe:"dsc_recipe:adventure/village/village_hero"},\
    first_reward:{emerald:4,score:10},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"铁块",\
        recipe_sum_first:"",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"hero_of_the_village",\
    display:{\
        title:{"translate":"task.hero_of_the_village","italic":false},\
        lore:[{"translate":"task.hero_of_the_village.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["10"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"铁块","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["10"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:village_hero/give",\
        take:"dsc_recipe:village_hero/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}