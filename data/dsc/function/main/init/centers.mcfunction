scoreboard players operation #center_x main = origin_x map
scoreboard players operation #center_z main = origin_z map
scoreboard players add #center_x main 512
scoreboard players add #center_z main 512

scoreboard players operation #center_x.nether main = nether_x map
scoreboard players operation #center_z.nether main = nether_z map
scoreboard players add #center_x.nether main 512
scoreboard players add #center_z.nether main 512

data modify storage run temp set value {x:0,z:0}
execute store result storage run temp.x int 1 run scoreboard players get #center_x main
execute store result storage run temp.z int 1 run scoreboard players get #center_z main
execute in overworld run function dsc:main/init/__world_center with storage run temp

data modify storage run temp set value {x:0,z:0}
execute store result storage run temp.x int 1 run scoreboard players get #center_x.nether main
execute store result storage run temp.z int 1 run scoreboard players get #center_z.nether main
execute in the_nether run function dsc:main/init/__world_center with storage run temp