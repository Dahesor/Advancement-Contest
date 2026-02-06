execute positioned over world_surface positioned ~ ~-1 ~ run function map:sample/color/find_block
data modify storage map:main chunk.color append from storage map:main color
scoreboard players operation __cumulate_h map += __new_y map

execute positioned ~8 ~ ~ positioned over world_surface positioned ~ ~-1 ~ run function map:sample/color/find_block
data modify storage map:main chunk.color append from storage map:main color
scoreboard players operation __cumulate_h map += __new_y map

execute positioned ~ ~ ~8 positioned over world_surface positioned ~ ~-1 ~ run function map:sample/color/find_block
data modify storage map:main chunk.color append from storage map:main color
scoreboard players operation __cumulate_h map += __new_y map

execute positioned ~8 ~ ~8 positioned over world_surface positioned ~ ~-1 ~ run function map:sample/color/find_block
data modify storage map:main chunk.color append from storage map:main color
scoreboard players operation __cumulate_h map += __new_y map