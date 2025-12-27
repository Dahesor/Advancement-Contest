scoreboard players enable @s input
execute unless score @s dialog matches 0 run function dsc:menu/trigger/mod
execute unless score @s input matches 0 run function dsc:menu/trigger/tp
execute if score @s refreshCD matches 1.. run scoreboard players remove @s refreshCD 1


data modify storage run test set value [0,0,0]

execute store result storage run test[0] int 1 run data get entity @s Pos[0]
execute store result storage run test[1] int 1 run data get entity @s Pos[1]
execute store result storage run test[2] int 1 run data get entity @s Pos[2]

title @s actionbar [{"text":"Position: "},{storage:"run",nbt:"test[0]"},{"text":", "},{storage:"run",nbt:"test[1]"},{"text":", "},{storage:"run",nbt:"test[2]"}]