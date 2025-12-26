#4
scoreboard players set next gen 0
function gen:ter/b_fetch/call

data modify storage gen b_fetch.fallback set value 5

scoreboard players add $vil_place gen 1

execute if score $vil_place gen matches 6..10 run return run function gen:ter/village/random

execute if score $vil_place gen matches 1 run return run data modify storage gen b_fetch.id set value "#minecraft:has_structure/village_desert"
execute if score $vil_place gen matches 2 run return run data modify storage gen b_fetch.id set value "#minecraft:has_structure/village_plains"
execute if score $vil_place gen matches 3 run return run data modify storage gen b_fetch.id set value "#minecraft:has_structure/village_savanna"
execute if score $vil_place gen matches 4 run return run data modify storage gen b_fetch.id set value "#minecraft:has_structure/village_taiga"
execute if score $vil_place gen matches 5 run return run data modify storage gen b_fetch.id set value "#minecraft:has_structure/village_snowy"
