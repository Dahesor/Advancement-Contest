data modify storage dsc:task new append value {\
    advancement:"dsc_adv:story/form_obsidian",\
    all_reward:{emerald:2,score:2,recipe:"dsc_recipe:story/adv/form_obsidian"},\
    first_reward:{emerald:4,score:5,recipe:"dsc_recipe:story/adv/form_obsidian_first"},\
    display:{lore_length:1},\
    additional_lore:{\
        all_:"",\
        first_:"",\
        recipe_sum_all:"纸，书\n打火石\n高炉",\
        recipe_sum_first:"切石机",\
    },\
    node:{node:"node",children:["dsc_adv:story/enter_the_nether"]}\
}


data modify storage dsc:task new[-1] merge value {\
    id:"form_obsidian",\
    display:{\
        title:{"translate":"task.form_obsidian","italic":false},\
        lore:[{"translate":"task.form_obsidian.1","italic":false,"color":"gray"}, "\n", {"translate":"task.reward","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["2"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["2"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"纸，书\n打火石\n高炉","italic":false,"color":"gray"}, "\n", {"translate":"task.reward_first","italic":false,"color":"light_purple"}, "\n", {"translate":"reward.score","italic":false,"color":"gold","with":["5"]}, "\n", {"translate":"reward.emerald","italic":false,"color":"green","with":["4"]}, "\n", {"translate":"reward.recipe","italic":false,"color":"aqua"}, "\n", {"text":"切石机","italic":false,"color":"gray"}],\
        \
        recipe_name_all:[],\
        \
        recipe_name_first:[],\
    },\
    funcs:{\
        give:"dsc_recipe:form_obsidian/give",\
        take:"dsc_recipe:form_obsidian/take",\
        give_first:"dsc_recipe:form_obsidian_first/give",\
        take_first:"dsc_recipe:form_obsidian_first/take",\
    }\
}