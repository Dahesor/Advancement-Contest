scoreboard players operation $x calc.DSC = $this input
scoreboard players operation $z calc.DSC = $this input

scoreboard players operation $x calc.DSC %= #100 calc.DSC
scoreboard players operation $z calc.DSC /= #100 calc.DSC

scoreboard players operation $x calc.DSC *= #48 calc.DSC
scoreboard players operation $z calc.DSC *= #48 calc.DSC
scoreboard players remove $x calc.DSC 24
scoreboard players remove $z calc.DSC 24

execute unless score @s md.dimension matches 2 run scoreboard players operation $x calc.DSC += origin_x map
execute unless score @s md.dimension matches 2 run scoreboard players operation $z calc.DSC += origin_z map
execute if score @s md.dimension matches 2 run scoreboard players operation $x calc.DSC += nether_x map
execute if score @s md.dimension matches 2 run scoreboard players operation $z calc.DSC += nether_z map

data modify storage run tp set value {x:0,z:0,in:"overworld"}
execute store result storage run tp.x int 1 run scoreboard players get $x calc.DSC
execute store result storage run tp.z int 1 run scoreboard players get $z calc.DSC
execute if score @s md.dimension matches 2 run data modify storage run tp.in set value "the_nether"
execute if score @s md.dimension matches 3 run data modify storage run tp.in set value "the_end"
function dsc:menu/trigger/__tp with storage run tp
dialog clear @s
tag @s remove dsc.mapping