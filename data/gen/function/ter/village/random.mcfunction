scoreboard players set next gen 0

function gen:ter/place/call

execute store result score $dx gen run random value -450..450
execute store result score $dz gen run random value -450..450
scoreboard players operation $dx gen += zero_x gen
scoreboard players operation $dz gen += zero_z gen

execute store result storage gen place.x int 1 run scoreboard players get $dx gen
execute store result storage gen place.z int 1 run scoreboard players get $dz gen
data modify storage gen place.fallback set value 6

execute store result score $rand gen run random value 1..3

execute if score $rand gen matches 1 run data modify storage gen place.id set value "gen:village_plains"
execute if score $rand gen matches 2 run data modify storage gen place.id set value "gen:village_savanna"
execute if score $rand gen matches 3 run data modify storage gen place.id set value "gen:village_taiga"