forceload add ~ ~
#scoreboard players add time main 1
execute if score invincible main matches 1 run function dsc:main/plugin/invincible
execute if score time main = STAGE_2_START_TIME main run function dsc:main/koh/launch
execute if score time main = STAGE_3_START_TIME main run function dsc:main/uhc/launch

#Stage Main
execute if score stage main matches 2 run function dsc:main/koh/tick

#Player
execute as @a[scores={team=1..}] at @s run function dsc:main/player/self

execute if score #loop_20 calc.DSC matches 1 run function dsc:main/plugin/op_update/start
execute if score #loop_20 calc.DSC matches 18 run function dsc:main/second