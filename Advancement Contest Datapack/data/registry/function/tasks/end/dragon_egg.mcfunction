data modify storage dsc:task new append value {\
    advancement:"dsc_adv:end/dragon_egg",\
    all_reward:{emerald:0,score:1},\
    first_reward:{emerald:20,score:24,recipe:"dsc_recipe:end/get_egg_first"},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:[],\
        recipe_sum_first:["diamond_chestplate","diamond_leggings","diamond_helmet","bookshelf","anvil","totem_of_undying"],\
    }\
}


data modify storage dsc:task new[-1] merge value {\
    id:"dragon_egg",\
    display:{\
        title:{"translate":"task.dragon_egg","italic":false},\
        lore:[{"translate":"task.dragon_egg.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["1"]}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["24"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["20"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", [{"text": "", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.diamond_chestplate"}, {"translate": "si.diamond_leggings"}, {"translate": "si.diamond_helmet"}, {"translate": "si.bookshelf"}, {"translate": "si.anvil"}, {"translate": "si.totem_of_undying"}]],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"registry:null",\
        take:"registry:null",\
        give_first:"dsc_recipe:get_egg_first/give",\
        take_first:"dsc_recipe:get_egg_first/take",\
    }\
}