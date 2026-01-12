data modify storage dsc:task new append value {\
    advancement:"dsc_adv:husbandry/safely_harvest_honey",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:husbandry/sign/harvest_honey"},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"蜂蜜块, 蜂蜜瓶\n蜜脾块",\
        recipe_sum_first:"",\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"safely_harvest_honey",\
    display:{\
        title:{"translate":"task.safely_harvest_honey","italic":false},\
        lore:[{"translate":"task.safely_harvest_honey.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"蜂蜜块, 蜂蜜瓶\n蜜脾块","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:harvest_honey/give",\
        take:"dsc_recipe:harvest_honey/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}