scoreboard players operation origin_x map = #x calc.DSC
scoreboard players operation origin_z map = #z calc.DSC
scoreboard players set size map 64
scoreboard players operation nether_x map = origin_x map
scoreboard players operation nether_z map = origin_z map
scoreboard players add nether_x map 512
scoreboard players add nether_z map 512
scoreboard players operation nether_x map /= NETHER_SCALE main
scoreboard players operation nether_z map /= NETHER_SCALE main
scoreboard players remove nether_x map 512
scoreboard players remove nether_z map 512

data modify storage run num set value {x:0,z:0}
execute store result storage run num.x int 1 run scoreboard players add #x calc.DSC 512
execute store result storage run num.z int 1 run scoreboard players add #z calc.DSC 512

function dsc:core/initialize/__locate with storage run num