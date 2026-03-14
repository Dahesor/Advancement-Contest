scoreboard players enable @a dialog
execute as @a at @s run function dsc:player/tick
execute as @e[type=marker,tag=outpost] at @s run function dsc:module/respawn/op/ticker

execute if score on main matches 1.. run function dsc:main/ticker

execute if score centered main matches 1 run function map:scanner/ctrl/switcher
execute if score centered main matches 1 run function map:render/switch/dim
execute if score #loop_20 calc.DSC matches 13 if score centered main matches 1 run function map:render/player/get_all
execute if score #loop_20 calc.DSC matches 5 if score centered main matches 1 run function map:render/player/get_all
tp 0-0-0-0-0 ~ 500 ~
execute store result score $gametime calc.DSC run time query gametime

scoreboard players add #loop_20 calc.DSC 1
execute if score #loop_20 calc.DSC matches 20.. run scoreboard players set #loop_20 calc.DSC 0


scoreboard players remove $map_frame calc.DSC 1
execute if entity @a[tag=dsc.__mapping_request] run function map:page/main
execute if score $map_frame calc.DSC matches ..0 if entity @a[tag=dsc.mapping] run function map:page/main

