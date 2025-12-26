##-51 -> -20
tellraw @a [{text:"\n[gen:ac] 正在让远古城市变得危险……",color:"gray"}]

scoreboard players operation acx1 gen = acx gen
scoreboard players operation acz1 gen = acz gen
scoreboard players remove acx1 gen 100
scoreboard players remove acz1 gen 100
scoreboard players operation acx2 gen = acx gen
scoreboard players operation acz2 gen = acz gen
scoreboard players add acx2 gen 100
scoreboard players add acz2 gen 100

data modify storage run ac set value {x:0,z:0}
execute store result storage run ac.x int 1 run scoreboard players get acx gen
execute store result storage run ac.z int 1 run scoreboard players get acz gen

schedule function gen:ac/ticker 5s replace
forceload add ~-120 ~-120 ~120 ~120

scoreboard players set $exe gen 1
scoreboard players set acy gen -58
scoreboard players set $cd gen 0
scoreboard players set $reform gen 0
gamerule max_block_modifications 80000