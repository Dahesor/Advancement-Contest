execute positioned over world_surface positioned ~ ~-1 ~ run function map:sample/ascii/find_block
execute if score SUPER_SAMPLE map matches 4 run function map:scanner/types/super/3_more
data modify storage map:main chunk.ascii append from storage map:main ascii
scoreboard players operation __cumulate_h map += __new_y map

execute positioned ~8 ~ ~ positioned over world_surface positioned ~ ~-1 ~ run function map:sample/ascii/find_block
execute if score SUPER_SAMPLE map matches 4 positioned ~8 ~ ~ run function map:scanner/types/super/3_more
data modify storage map:main chunk.ascii append from storage map:main ascii
scoreboard players operation __cumulate_h map += __new_y map

execute positioned ~ ~ ~8 positioned over world_surface positioned ~ ~-1 ~ run function map:sample/ascii/find_block
execute if score SUPER_SAMPLE map matches 4 positioned ~ ~ ~8 run function map:scanner/types/super/3_more
data modify storage map:main chunk.ascii append from storage map:main ascii
scoreboard players operation __cumulate_h map += __new_y map

execute positioned ~8 ~ ~8 positioned over world_surface positioned ~ ~-1 ~ run function map:sample/ascii/find_block
execute if score SUPER_SAMPLE map matches 4 positioned ~8 ~ ~8 run function map:scanner/types/super/3_more
data modify storage map:main chunk.ascii append from storage map:main ascii
scoreboard players operation __cumulate_h map += __new_y map