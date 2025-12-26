#31

scoreboard players set next gen 1
scoreboard players set phase gen 30

execute if score has_mansion gen matches 1.. run return fail

execute store result score $rand gen run random value 1..100
execute unless data storage gen b_fetch{success:true} if score $rand gen matches ..50 run return fail

function gen:ter/place/call

execute store result score $dx gen run random value -450..450
execute store result score $dz gen run random value -450..450
scoreboard players operation $dx gen += zero_x gen
scoreboard players operation $dz gen += zero_z gen

execute unless data storage gen b_fetch{success:true} store result storage gen place.x int 1 run scoreboard players get $dx gen
execute unless data storage gen b_fetch{success:true} store result storage gen place.z int 1 run scoreboard players get $dz gen

execute if data storage gen b_fetch{success:true} run data modify storage gen place merge from storage gen b_fetch.result
data modify storage gen place.id set value "mansion"
data modify storage gen place.fallback set value 32