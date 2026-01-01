scoreboard players set centered main 1

#Get corner
execute store result score #x calc.DSC run data get entity @s Pos[0]
execute store result score #z calc.DSC run data get entity @s Pos[2]
scoreboard players add #x calc.DSC 64
scoreboard players add #z calc.DSC 64
scoreboard players operation #x calc.DSC /= #1024 calc.DSC
scoreboard players operation #x calc.DSC *= #1024 calc.DSC
scoreboard players operation #z calc.DSC /= #1024 calc.DSC
scoreboard players operation #z calc.DSC *= #1024 calc.DSC
scoreboard players remove #x calc.DSC 64
scoreboard players remove #z calc.DSC 64

scoreboard players operation origin_x map = #x calc.DSC
scoreboard players operation origin_z map = #z calc.DSC
scoreboard players set size map 64
scoreboard players operation nether_x map = origin_x map
scoreboard players operation nether_z map = origin_z map
scoreboard players add nether_x map 512
scoreboard players add nether_z map 512
scoreboard players operation nether_x map /= #8 calc.DSC
scoreboard players operation nether_z map /= #8 calc.DSC
scoreboard players remove nether_x map 512
scoreboard players remove nether_z map 512

data modify storage run num set value {x:0,z:0}
execute store result storage run num.x int 1 run scoreboard players add #x calc.DSC 512
execute store result storage run num.z int 1 run scoreboard players add #z calc.DSC 512

function dsc:core/initialize/__locate with storage run num