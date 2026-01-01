scoreboard players add @s trigger.biomes 1
execute if score @s trigger.biomes matches 20.. run return run advancement grant @s only dsc_adv:adventure/adventuring_time

data modify storage run int set value {i:0}
execute store result storage run int.i int 1 run scoreboard players get @s trigger.biomes
function dsc:module/adv/trigger/__biomes with storage run int