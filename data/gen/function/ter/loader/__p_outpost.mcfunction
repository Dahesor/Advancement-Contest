execute unless score $target_outpost gen matches 1.. store result score $target_outpost gen run random value 3..5
execute if score has_p_outpost gen >= $target_outpost gen run return fail

scoreboard players set next gen 1
scoreboard players set phase gen 33

data modify storage gen l set value {}
data merge storage gen {l:{type:"biome",id:"#minecraft:is_ocean",x:0,z:0}}

execute store result score $px gen run random value -450..450
execute store result score $pz gen run random value -450..450
execute store result storage gen l.x int 1 run scoreboard players get $px gen
execute store result storage gen l.z int 1 run scoreboard players get $pz gen

function gen:locate/core/find