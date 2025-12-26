scoreboard players set next gen 0
execute unless data storage gen b_fetch{success:true} run return run scoreboard players set phase gen 4

function gen:ter/place/call
data modify storage gen place.x set from storage gen b_fetch.result.x
data modify storage gen place.z set from storage gen b_fetch.result.z
data modify storage gen place.fallback set value 6

execute if score $vil_place gen matches 1 run data modify storage gen place.id set value "gen:village_deseret"
execute if score $vil_place gen matches 2 run data modify storage gen place.id set value "gen:village_plains"
execute if score $vil_place gen matches 3 run data modify storage gen place.id set value "gen:village_savanna"
execute if score $vil_place gen matches 4 run data modify storage gen place.id set value "gen:village_taiga"
execute if score $vil_place gen matches 5 run data modify storage gen place.id set value "gen:village_snowy"