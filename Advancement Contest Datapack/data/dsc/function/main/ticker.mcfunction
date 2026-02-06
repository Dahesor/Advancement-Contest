#Initialize
scoreboard players reset #last_spawn_cache team
#Initialize

execute unless score debug main matches 1 run scoreboard players add time main 1
execute if score invincible main matches 1 run function dsc:main/plugin/invincible
execute if score time main = STAGE_2_START_TIME main run function dsc:main/koh/launch
execute if score time main = STAGE_3_START_TIME main run function dsc:main/uhc/launch

#Stage Main
execute if score stage main matches 2 run function dsc:main/koh/tick
execute if score stage main matches 3 run function dsc:main/uhc/tick

#Player
execute store result score expected_player_count main run data get storage main: online
scoreboard players set player_count main 0
function dsc:main/player/split
execute if score player_count main < expected_player_count main run function dsc:main/plugin/offline/_get_/entry

execute if score #loop_20 calc.DSC matches 1 run function dsc:main/plugin/op_update/start
execute if score #loop_20 calc.DSC matches 18 run function dsc:main/second

#Selectors
execute as @e[type=item] if items entity @s contents barrier[custom_data~{becon_drop:true}] at @s run function dsc:module/respawn/drop/item

#========== Order Matters ==========