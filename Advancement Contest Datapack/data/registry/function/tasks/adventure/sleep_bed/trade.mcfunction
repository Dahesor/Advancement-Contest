data modify storage dsc:task new append value {\
    advancement:"dsc_adv:adventure/trade",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:adventure/village/trade"},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:2},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["diamond_hoe"],\
        recipe_sum_first:[],\
    },\
    node:{node:"root",children:["dsc_adv:adventure/trade_at_world_height","dsc_adv:adventure/voluntary_exile"]}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"trade",\
    display:{\
        title:{"translate":"task.trade","italic":false},\
        lore:[{"translate":"task.trade.1","italic":false,"color":"gray"}, "\n", {"translate":"task.trade.2","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", [{"text": "", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.diamond_hoe"}], "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:trade/give",\
        take:"dsc_recipe:trade/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}