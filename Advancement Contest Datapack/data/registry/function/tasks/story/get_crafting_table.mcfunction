data modify storage dsc:task new append value {\
    advancement:"dsc_adv:story/make_crafting_table",\
    all_reward:{emerald:0,score:0,recipe:"dsc_recipe:story/crafting_table"},\
    first_reward:{emerald:0,score:10},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["wooden_pickaxe","wooden_axe","leather_chestplate","furnace","ladder","barrel"],\
        recipe_sum_first:[],\
    },\
    node:{node:"root",default_pin:true,children:["dsc_adv:story/mine_stone","dsc_adv:adventure/adventuring_time","dsc_adv:adventure/sleep_in_bed","dsc_adv:husbandry/plant_seed"]}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"get_crafting_table",\
    display:{\
        title:{"translate":"task.get_crafting_table","italic":false},\
        lore:[{"translate":"task.get_crafting_table.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, [{"text": "=====", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.wooden_pickaxe", "extra": ["-"], "fallback": ""}, {"translate": "si.wooden_axe", "extra": ["-"], "fallback": ""}, {"translate": "si.leather_chestplate", "extra": ["-"], "fallback": ""}, {"translate": "si.furnace", "extra": ["-"], "fallback": ""}, {"translate": "si.ladder", "extra": ["-"], "fallback": ""}, {"translate": "si.barrel", "extra": ["-"], "fallback": ""}], "\n", "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["10"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:crafting_table/give",\
        take:"dsc_recipe:crafting_table/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}