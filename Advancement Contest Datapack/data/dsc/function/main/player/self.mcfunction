function dsc:player/uid/get

scoreboard players add player_count main 1

execute if score #loop_20 calc.DSC matches 3 run function dsc:main/player/hurt/bounty/update

execute if entity @s[tag=__killed] run function dsc:main/player/hurt/bounty/read_data

execute if score @s death matches 1.. run function dsc:main/player/death/spectate
execute if entity @s[tag=dead] run function dsc:main/player/death/check

execute if score @s used.map matches 1.. run function dsc:main/player/misc/map/enter

execute if entity @s[gamemode=!spectator] as 0-0-0-0-0 run function dsc:main/player/offline/pos