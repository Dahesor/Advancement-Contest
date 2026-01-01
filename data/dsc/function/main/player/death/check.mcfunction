tp @s 0-0-0-0-0
execute if score @s revive_time matches 2.. run scoreboard players remove @s revive_time 1
execute if score @s revive_time matches 2 run tag @s[tag=!aced] add respawning
execute if score @s revive_time matches 2 if entity @s[tag=!aced] run function dsc:main/player/death/menu/arrange
execute if score #loop_20 calc.DSC matches 13 if entity @s[tag=respawning,tag=!aced] run function dsc:main/player/death/menu/arrange

execute if score @s revive_time matches 1 if entity @s[tag=aced] run function dsc:main/player/death/ace/respawn