data modify storage dsc:task new append value {\
    advancement:"dsc_adv:story/enter_the_end",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:story/adv/enter_the_end"},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["diamond_axe","diamond_chestplate"],\
        recipe_sum_first:[],\
    },\
    node:{node:"node",children:["dsc_adv:end/kill_dragon","dsc_adv:adventure/spyglass_at_dragon"]}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"enter_the_end",\
    display:{\
        title:{"translate":"task.enter_the_end","italic":false},\
        lore:[{"translate":"task.enter_the_end.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", [{"text": "", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.diamond_axe"}, {"translate": "si.diamond_chestplate"}], "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:enter_the_end/give",\
        take:"dsc_recipe:enter_the_end/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}