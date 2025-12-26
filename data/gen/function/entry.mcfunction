scoreboard objectives remove gen
scoreboard objectives add gen dummy

data modify storage map:main dec set value []

gamerule command_block_output true
gamerule block_drops false
gamerule entity_drops false
execute store result score spec_gen_chunk gen run gamerule spectators_generate_chunks
gamerule spectators_generate_chunks true
schedule function gen:main 1t replace


scoreboard players operation min_x gen = origin_x map
scoreboard players operation min_z gen = origin_z map
scoreboard players operation max_x gen = origin_x map
scoreboard players operation max_z gen = origin_z map
scoreboard players operation zero_x gen = origin_x map
scoreboard players operation zero_z gen = origin_z map

scoreboard players add zero_x gen 512
scoreboard players add zero_z gen 512

scoreboard players add max_x gen 1024
scoreboard players add max_z gen 1024

scoreboard players set phase gen 1
scoreboard players set next gen 0
scoreboard players set vil_x gen -512
scoreboard players set vil_z gen -512

data modify storage gen vil set value {m:[],a:[],n:{x:0,z:0}}