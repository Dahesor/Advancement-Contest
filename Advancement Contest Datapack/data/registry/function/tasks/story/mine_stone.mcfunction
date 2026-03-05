data modify storage dsc:task new append value {\
    advancement:"dsc_adv:story/mine_stone",\
    all_reward:{emerald:3,score:0,recipe:"dsc_recipe:story/wooden_pickaxe"},\
    first_reward:{emerald:0,score:2},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["stone_pickaxe","stone_axe","stone_sword","stone_shovel","stone_hoe"],\
        recipe_sum_first:[],\
    },\
    node:{node:"node",default_pin:true,children:["dsc_adv:story/upgrade_tools"]}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"mine_stone",\
    display:{\
        title:{"translate":"task.mine_stone","italic":false},\
        lore:[{"translate":"task.mine_stone.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["3"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", [{"text": "", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.stone_pickaxe", "extra": ["-"]}, {"translate": "si.stone_axe", "extra": ["-"]}, {"translate": "si.stone_sword", "extra": ["-"]}, {"translate": "si.stone_shovel", "extra": ["-"]}, {"translate": "si.stone_hoe", "extra": ["-"]}], "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["2"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:wooden_pickaxe/give",\
        take:"dsc_recipe:wooden_pickaxe/take",\
        give_first:"dsc_recipe:caves_cliff/give",\
        take_first:"dsc_recipe:caves_cliff/take",\
    }\
}