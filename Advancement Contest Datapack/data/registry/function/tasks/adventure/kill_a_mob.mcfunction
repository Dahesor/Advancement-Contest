data modify storage dsc:task new append value {\
    advancement:"dsc_adv:adventure/kill_a_mob",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:adventure/monster_hunter"},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:2},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["iron_chestplate","dsc:iron_sword_p","wooden_spear","bow"],\
        recipe_sum_first:[],\
    },\
    node:{node:"root",default_pin:true,children:["dsc_adv:adventure/kill_all_mobs","dsc_adv:adventure/shoot_arrow","dsc_adv:adventure/throw_trident"]}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"kill_a_mob",\
    display:{\
        title:{"translate":"task.kill_a_mob","italic":false},\
        lore:[{"translate":"task.kill_a_mob.1","italic":false,"color":"gray"}, "\n", {"translate":"task.kill_a_mob.2","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", [{"text": "", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.iron_chestplate"}, {"translate": "si.dsc:iron_sword_p"}, {"translate": "si.wooden_spear"}, {"translate": "si.bow"}], "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:monster_hunter/give",\
        take:"dsc_recipe:monster_hunter/take",\
        give_first:"dsc_recipe:monster_hunter/give",\
        take_first:"dsc_recipe:monster_hunter/take",\
    }\
}