scoreboard players add $reform gen 1
execute if score $reform gen matches 1 run return run execute positioned ~-100 -51 ~-100 run kill @e[type=#gen:ac_kill,dx=200,dy=36,dz=200]

scoreboard players operation $patch_x gen = $reform gen
scoreboard players operation $patch_x gen %= #22 calc.DSC
scoreboard players operation $patch_z gen = $reform gen
scoreboard players operation $patch_z gen /= #22 calc.DSC

scoreboard players remove $patch_x gen 11
scoreboard players remove $patch_z gen 11

scoreboard players operation $patch_x gen *= #10 calc.DSC
scoreboard players operation $patch_z gen *= #10 calc.DSC

data modify storage run acy set value {x:0,z:0}
execute store result storage run acy.x int 1 run scoreboard players get $patch_x gen
execute store result storage run acy.z int 1 run scoreboard players get $patch_z gen
execute store result score $rand gen run random value 1..100
execute if score $rand gen matches 1..50 run function gen:ac/reform/__pop with storage run acy

execute if score $reform gen matches 485.. run scoreboard players add $exe gen 1