data modify storage dsc:task new append value {\
    advancement:"dsc_adv:husbandry/allay_deliver_item",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:husbandry/allay/allay"},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["jukebox","note_block"],\
        recipe_sum_first:[],\
    },node:{children:["dsc_adv:husbandry/allay_deliver_cake","dsc_adv:adventure/play_jukebox"],node:"node"}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"allay_deliver_item",\
    display:{\
        title:{"translate":"task.allay_deliver_item","italic":false},\
        lore:[{"translate":"task.allay_deliver_item.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", [{"text": "", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.jukebox", "extra": ["-"]}, {"translate": "si.note_block", "extra": ["-"]}], "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:allay/give",\
        take:"dsc_recipe:allay/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}