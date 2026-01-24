data modify storage dlm: proc.chunks set value [{x:0,z:0}]
execute store result storage dlm: proc.chunks[0].x int 1 run scoreboard players operation #x dlm.int /= #16 dlm.int
execute store result storage dlm: proc.chunks[0].z int 1 run scoreboard players operation #z dlm.int /= #16 dlm.int