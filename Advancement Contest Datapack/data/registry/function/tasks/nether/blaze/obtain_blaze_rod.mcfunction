data modify storage dsc:task new append value {\
    advancement:"dsc_adv:nether/obtain_blaze_rod",\
    all_reward:{emerald:2,score:4,recipe:"dsc_recipe:nether/into_fire"},\
    first_reward:{emerald:4,score:5},\
    display:{lore_length:2},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:["blaze_powder","ender_eye"],\
        recipe_sum_first:[],\
    },\
    node:{node:"node",children:["dsc_adv:nether/brew_potion","dsc_adv:story/follow_ender_eye"]}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"obtain_blaze_rod",\
    display:{\
        title:{"translate":"task.obtain_blaze_rod","italic":false},\
        lore:[{"translate":"task.obtain_blaze_rod.1","italic":false,"color":"gray"}, "\n", {"translate":"task.obtain_blaze_rod.2","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["4"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", [{"text": "", "font": "dsc:tasks/recipe", "underlined": false, "color": "white"}, {"translate": "si.blaze_powder"}, {"translate": "si.ender_eye"}], "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:into_fire/give",\
        take:"dsc_recipe:into_fire/take",\
        give_first:"registry:null",\
        take_first:"registry:null",\
    }\
}