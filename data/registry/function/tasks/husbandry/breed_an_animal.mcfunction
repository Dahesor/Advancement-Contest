data modify storage dsc:task new append value {\
    advancement:"dsc_adv:husbandry/breed_an_animal",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:breed_animal"},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"小麦",\
        recipe_sum_first:"",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"breed_an_animal",\
    display:{\
        title:{"translate":"task.breed_an_animal","italic":false},\
        lore:[{"translate":"task.breed_an_animal.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"小麦","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:breed_animal/give",\
        take:"dsc_recipe:breed_animal/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}