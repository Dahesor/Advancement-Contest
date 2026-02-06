execute if score $cd gen matches 1..5 run return run scoreboard players add $cd gen 1

data modify storage run acy set value {y:0}
execute store result storage run acy.y int 1 run scoreboard players get acy gen

function gen:ac/__fillbiome with storage run acy

scoreboard players add acy gen 1
scoreboard players set $cd gen 1
execute unless score acy gen matches -16.. run return 1

#Next
scoreboard players add $exe gen 1
scoreboard players set acy gen -51
data modify storage gen gen_log prepend value [{text:"\n[gen:ac] 整顿古城生态……",color:"gray"}]