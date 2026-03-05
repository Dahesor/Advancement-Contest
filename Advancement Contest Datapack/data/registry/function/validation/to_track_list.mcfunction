data modify storage team: track_list.this set value {}
data modify storage team: track_list.this.id set from storage dsc:task run.id
data modify storage team: track_list.this.advancement set from storage dsc:task run.advancement
data modify storage team: track_list.this.title set from storage dsc:task run.display.title.translate
data modify storage team: track_list.this.icon set string storage team: track_list.this.title 3
data modify storage team: track_list.this.pin set from storage dsc:task run.node.default_pin
data modify storage team: track_list.this.node set from storage dsc:task run.node.node
data modify storage team: track_list.this.completed set from storage dsc:task run.completed

execute store result score #temp calc.DSC run data get storage dsc:task run.display.lore_length
data modify storage team: track_list.this.lore set value []
execute if score #temp calc.DSC matches 1.. run data modify storage team: track_list.this.lore append from storage dsc:task run.display.lore[0].translate
execute if score #temp calc.DSC matches 2.. run data modify storage team: track_list.this.lore append from storage dsc:task run.display.lore[2].translate
execute if score #temp calc.DSC matches 3.. run data modify storage team: track_list.this.lore append from storage dsc:task run.display.lore[4].translate

data modify storage team: track_list.this.recipe_icon set value {all:[],first:[]}
data modify storage team: track_list.this.reward set value {all:[""],first:[""]}
data modify storage temp t set value [{text:"",font:"dsc:tasks/recipe",shadow_color:0}]
data modify storage run k set value []
data modify storage run s set value {s:""}
scoreboard players set $emerald calc.DSC 0
scoreboard players set $score calc.DSC 0
scoreboard players set $first_emerald calc.DSC 0
scoreboard players set $first_score calc.DSC 0
data modify storage run int set value 0

## All REWARD
    # Get score and emerald amount
        execute if data storage dsc:task run.all_reward.emerald store result score $emerald calc.DSC run data get storage dsc:task run.all_reward.emerald
        execute if data storage dsc:task run.all_reward.score store result score $score calc.DSC run data get storage dsc:task run.all_reward.score
    # Make recipe icons
        data modify storage run k append from storage dsc:task run.additional_lore.recipe_sum_all[]
        function registry:validation/proc/make_recipe_icon
        data modify storage team: track_list.this.recipe_icon.all set from storage temp t
        execute store result score #count calc.DSC run data get storage team: track_list.this.recipe_icon.all
        data modify storage run n set value []
        function registry:validation/proc/append_neg_space
        data modify storage team: track_list.this.recipe_icon.all append from storage run n[]

    # If score > 0, add a line about score
        execute store result storage run int int 1 run scoreboard players get $score calc.DSC
        execute if score $score calc.DSC matches 1.. run data modify storage team: track_list.this.reward.all append value {translate:"track_list.score",color:"aqua",with:[""]}
        execute if score $score calc.DSC matches 1.. run data modify storage team: track_list.this.reward.all[-1].with[0] set string storage run int
        execute if score $score calc.DSC matches 1.. run data modify storage team: track_list.this.reward.all append value "\n"
        execute store result storage run int int 1 run scoreboard players get $emerald calc.DSC

    # If emerald > 0, add a line about emerald
        execute if score $emerald calc.DSC matches 1.. run data modify storage team: track_list.this.reward.all append value {translate:"track_list.emerald",color:"green",with:[""]}
        execute if score $emerald calc.DSC matches 1.. run data modify storage team: track_list.this.reward.all[-1].with[0] set string storage run int
        execute if score $emerald calc.DSC matches 1.. run data modify storage team: track_list.this.reward.all append value "\n"

    # If there is recipe, add a line about recipe
        execute if data storage temp t[1] run data modify storage team: track_list.this.reward.all append value {translate:"track_list.recipe",color:"gray"}
        execute if data storage temp t[1] run data modify storage team: track_list.this.reward.all append from storage temp t

## First Reward
    # Get score and emerald amount
        execute if data storage dsc:task run.first_reward.emerald store result score $first_emerald calc.DSC run data get storage dsc:task run.first_reward.emerald
        execute if data storage dsc:task run.first_reward.score store result score $first_score calc.DSC run data get storage dsc:task run.first_reward.score
        scoreboard players operation $emerald calc.DSC += $first_emerald calc.DSC
        scoreboard players operation $score calc.DSC += $first_score calc.DSC

    # Make recipe icons
        data modify storage run k append from storage dsc:task run.additional_lore.recipe_sum_first[]
        function registry:validation/proc/make_recipe_icon
        data modify storage team: track_list.this.recipe_icon.first set from storage temp t
        execute store result score #count calc.DSC run data get storage team: track_list.this.recipe_icon.first
        data modify storage run n set value []
        function registry:validation/proc/append_neg_space
        data modify storage team: track_list.this.recipe_icon.first append from storage run n[]

    # If score > 0, add a line about score
        execute store result storage run int int 1 run scoreboard players get $score calc.DSC
        execute if score $score calc.DSC matches 1.. run data modify storage team: track_list.this.reward.first append value {translate:"track_list.score",color:"aqua",with:[""]}
        execute if score $score calc.DSC matches 1.. run data modify storage team: track_list.this.reward.first[-1].with[0] set string storage run int
        execute if score $score calc.DSC matches 1.. run data modify storage team: track_list.this.reward.first append value "\n"

    # If emerald > 0, add a line about emerald
        execute store result storage run int int 1 run scoreboard players get $emerald calc.DSC
        execute if score $emerald calc.DSC matches 1.. run data modify storage team: track_list.this.reward.first append value {translate:"track_list.emerald",color:"green",with:[""]}
        execute if score $emerald calc.DSC matches 1.. run data modify storage team: track_list.this.reward.first[-1].with[0] set string storage run int
        execute if score $emerald calc.DSC matches 1.. run data modify storage team: track_list.this.reward.first append value "\n"

    # If there is recipe, add a line about recipe
        execute if data storage temp t[1] run data modify storage team: track_list.this.reward.first append value {translate:"track_list.recipe",color:"gray"}
        execute if data storage temp t[1] run data modify storage team: track_list.this.reward.first append from storage temp t