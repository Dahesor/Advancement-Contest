scoreboard players set phase gen -103
scoreboard players set next gen 1

scoreboard players operation $dx gen = $1x gen
scoreboard players operation $dz gen = $1z gen
scoreboard players operation $dx gen -= zero_x gen
scoreboard players operation $dz gen -= zero_z gen

data modify storage gen l set value {}
data merge storage gen {l:{type:"biome",id:"the_void",x:0,z:0,step:200}}
data modify storage gen l.id set from storage gen b_fetch.id
execute store result storage gen l.x int 1 run scoreboard players get $dx gen
execute store result storage gen l.z int 1 run scoreboard players get $dz gen
function gen:locate/core/find