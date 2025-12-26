#11
scoreboard players set next gen 1
scoreboard players set phase gen 11

execute unless score $find gen matches 1.. run scoreboard players set $find gen 0
data modify storage gen l set value {}
data merge storage gen {l:{type:"structure",id:"desert_pyramid"}}
execute if score $find gen matches 0 run function gen:locate/core/find
execute if score $find gen matches 0 run return run scoreboard players set $find gen 1

scoreboard players set phase gen 12
scoreboard players set next gen 0
scoreboard players set $find gen 0
function gen:locate/core/read
execute if score warning gen matches 1.. run scoreboard players set next gen 5
scoreboard players operation has_desert_pyramid gen = in_range gen
execute unless score in_range gen matches 1.. run return fail

data modify storage map:main dec append value {x:0,z:0,char:"d"}
execute store result storage map:main dec[-1].x int 1 run scoreboard players get x gen
execute store result storage map:main dec[-1].z int 1 run scoreboard players get z gen