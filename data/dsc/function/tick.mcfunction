scoreboard players enable @a dialog
execute as @a at @s run function dsc:player/tick
execute as @e[type=marker,tag=outpost] at @s run function dsc:module/respawn/op/ticker

execute if score on main matches 1.. run function dsc:main/ticker

execute if score centered main matches 1 run function map:scanner/locater
execute if score centered main matches 1 run function map:render/draw
execute if score centered main matches 1 run forceload add ~ ~
tp 0-0-0-0-0 ~ 500 ~

scoreboard players add #loop_20 calc.DSC 1
execute if score #loop_20 calc.DSC matches 20.. run scoreboard players set #loop_20 calc.DSC 0

scoreboard players remove $map_frame calc.DSC 1
execute if entity @a[tag=dsc.__mapping_request] run function map:page/main
execute if score $map_frame calc.DSC matches ..0 if entity @a[tag=dsc.mapping] run function map:page/main