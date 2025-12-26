scoreboard players set phase gen 2
scoreboard players set next gen 1


data modify storage gen l set value {}
data merge storage gen {l:{type:"structure",id:"#village",x:0,z:0}}
execute store result storage gen l.x int 1 run scoreboard players get vil_x gen
execute store result storage gen l.z int 1 run scoreboard players get vil_z gen
function gen:locate/core/find

scoreboard players add vil_x gen 341
execute if score vil_x gen matches 512.. run scoreboard players add vil_z gen 341
execute if score vil_x gen matches 512.. run scoreboard players set vil_x gen -512