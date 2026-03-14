data modify storage run ascii set value []
data modify storage run ascii append from storage map:main ascii
scoreboard players set $skip_height map 1

execute positioned ~4 ~ ~ positioned over world_surface positioned ~ ~-1 ~ run function map:sample/ascii/find_block
data modify storage run ascii append from storage map:main ascii

execute positioned ~ ~ ~4 positioned over world_surface positioned ~ ~-1 ~ run function map:sample/ascii/find_block
data modify storage run ascii append from storage map:main ascii

#execute positioned ~4 ~ ~4 positioned over world_surface positioned ~ ~-1 ~ run function map:sample/ascii/find_block
#data modify storage run ascii append from storage map:main ascii

scoreboard players set $skip_height map 0

data modify storage run k set from storage run ascii
execute store result score #count map run data modify storage run k[] set from storage run ascii[0]
execute if score #count map matches ..1 run return run data modify storage map:main ascii set from storage run ascii[0]

data modify storage run k set from storage run ascii
execute store result score #count map run data modify storage run k[] set from storage run ascii[1]
execute if score #count map matches ..1 run return run data modify storage map:main ascii set from storage run ascii[1]

#data modify storage run k set from storage run ascii
#execute store result score #count map run data modify storage run k[] set from storage run ascii[2]
#execute if score #count map matches ..1 run return run data modify storage map:main ascii set from storage run ascii[2]

data modify storage map:main ascii set from storage run ascii[0]