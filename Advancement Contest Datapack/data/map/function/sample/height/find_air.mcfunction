execute if block ~ ~ ~ #air positioned ~ ~-1 ~ run return run function map:sample/height/find_solid
scoreboard players remove __left map 1
execute if score __left map matches 1.. positioned ~ ~-1 ~ run function map:sample/height/find_air