scoreboard players set __in_world map 1
function map:scanner/in_border
function map:scanner/main
scoreboard players set __next_line map 0
scoreboard players set __reset map 0

scoreboard players add __cx map 1
execute if score __cx map >= size map run scoreboard players set __next_line map 1
execute if score __cx map >= size map run scoreboard players add __cz map 1
execute if score __cx map >= size map run scoreboard players set __cx map 0
execute if score __cz map >= size map run scoreboard players set __reset map 1
execute if score __cz map >= size map run scoreboard players set __cz map 0
#===========
#tellraw @a ["",{"text":"[","color":"gray"},{"text":"Map Scanner","color":"aqua"},{"text":"] ","color":"gray"},{"text":"Scanning chunk (","color":"gray"},{"color":"aqua","score":{"name":"__cx","objective":"map"}},{"text":", ","color":"gray"},{"color":"aqua","score":{"name":"__cz","objective":"map"}},{"text":")","color":"gray"}]
#===========
scoreboard players add __loop map 1
execute if score __loop map >= __lookup map run return fail

execute if score __sample map >= SAMPLE_MAX map run return fail

execute if score __reset map matches 1 positioned ~-1008 ~ ~-1008 run return run function map:scanner/ticker
execute if score __next_line map matches 1 positioned ~-1008 ~ ~16 run return run function map:scanner/ticker
execute positioned ~16 ~ ~ run function map:scanner/ticker