scoreboard players operation __shift_x map = __cx map
scoreboard players operation __shift_z map = __cz map
scoreboard players operation __shift_x map *= #16 calc.DSC
scoreboard players operation __shift_z map *= #16 calc.DSC
scoreboard players operation __shift_x map += origin_x map
scoreboard players operation __shift_z map += origin_z map

scoreboard players set __loop map 0
scoreboard players set __sample map 0

data modify storage run coords set value {x:0,z:0}
execute store result storage run coords.x int 1 run scoreboard players get __shift_x map
execute store result storage run coords.z int 1 run scoreboard players get __shift_z map
data modify storage run index set value {x:0,z:0}
function map:scanner/main_entry with storage run coords
