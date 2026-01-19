function dsc:player/uid/get

execute if score @s death matches 1.. run function dsc:main/player/death/spectate
execute if entity @s[tag=dead] run function dsc:main/player/death/check

execute if score @s used.map matches 1.. run function dsc:main/player/misc/apply_map

execute if entity @s[gamemode=!spectator] as 0-0-0-0-0 run function dsc:main/player/offline/pos