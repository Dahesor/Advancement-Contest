execute positioned over world_surface positioned ~ ~-1 ~ run function map:sample/ascii/find_block
data modify storage map:main chunk.ascii append from storage map:main ascii
scoreboard players operation __cumulate_h map += __new_y map

execute positioned ~8 ~ ~ positioned over world_surface positioned ~ ~-1 ~ run function map:sample/ascii/find_block
data modify storage map:main chunk.ascii append from storage map:main ascii
scoreboard players operation __cumulate_h map += __new_y map

execute positioned ~ ~ ~8 positioned over world_surface positioned ~ ~-1 ~ run function map:sample/ascii/find_block
data modify storage map:main chunk.ascii append from storage map:main ascii
scoreboard players operation __cumulate_h map += __new_y map

execute positioned ~8 ~ ~8 positioned over world_surface positioned ~ ~-1 ~ run function map:sample/ascii/find_block
data modify storage map:main chunk.ascii append from storage map:main ascii
scoreboard players operation __cumulate_h map += __new_y map