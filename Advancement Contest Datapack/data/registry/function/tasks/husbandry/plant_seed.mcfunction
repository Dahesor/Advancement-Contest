data modify storage dsc:task new append value {\
    advancement:"dsc_adv:husbandry/plant_seed",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:husbandry/plant_seed"},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:2},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["golden_hoe","bread","cookie","pumpkin_pie","cake","mushroom_stew","beetroot_soup"],\
        recipe_sum_first:[],\
    },node:{children:["dsc_adv:husbandry/make_cake"],node:"node"}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"plant_seed",\
    display:{\
        title:{"translate":"task.plant_seed","italic":false},\
        lore:[{"translate":"task.plant_seed.1","italic":false,"color":"gray"}, "\n", {"translate":"task.plant_seed.2","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", [{"text": "", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.golden_hoe", "extra": ["-"]}, {"translate": "si.bread", "extra": ["-"]}, {"translate": "si.cookie", "extra": ["-"]}, {"translate": "si.pumpkin_pie", "extra": ["-"]}, {"translate": "si.cake", "extra": ["-"]}, {"translate": "si.mushroom_stew", "extra": ["-"]}, {"translate": "si.beetroot_soup", "extra": ["-"]}], "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:plant_seed/give",\
        take:"dsc_recipe:plant_seed/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}