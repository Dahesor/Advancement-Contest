#Run at chunk origin
execute if score SHADER_TYPE map matches 1 run return run function map:sample/ascii
execute positioned ~2 ~ ~2 positioned over world_surface positioned ~ ~-1 ~ run function map:sample/color/find_block
execute positioned ~6 ~ ~2 positioned over world_surface positioned ~ ~-1 ~ run function map:sample/color/find_block
execute positioned ~2 ~ ~6 positioned over world_surface positioned ~ ~-1 ~ run function map:sample/color/find_block
execute positioned ~6 ~ ~6 positioned over world_surface positioned ~ ~-1 ~ run function map:sample/color/find_block