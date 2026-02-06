execute as 0-0-0-0-0 run function map:render/player/get_coord

execute if dimension overworld run scoreboard players operation x map -= origin_x map
execute if dimension overworld run scoreboard players operation z map -= origin_z map
execute if dimension the_nether run scoreboard players operation x map -= nether_x map
execute if dimension the_nether run scoreboard players operation z map -= nether_z map
execute if dimension the_end run scoreboard players add x map 512
execute if dimension the_end run scoreboard players add z map 150

#Out of Bounds
execute unless score x map matches -200..1224 unless score z map matches -200..1224 run return fail

#Clamp
execute if score x map matches ..0 run scoreboard players set x map 0
execute if score x map matches 1025.. run scoreboard players set x map 1024
execute if score z map matches ..0 run scoreboard players set z map 0
execute if score z map matches 1025.. run scoreboard players set z map 1024

#To Pixel Space
scoreboard players operation x map *= #1000 calc.DSC
scoreboard players operation z map *= #1000 calc.DSC
scoreboard players operation x map /= #2667 calc.DSC
scoreboard players operation z map /= #2667 calc.DSC

scoreboard players operation x map -= #384 calc.DSC
scoreboard players operation x map *= #-1 calc.DSC
function map:render/player/get_text_shift

function map:render/player/pack_text

data modify storage map:main num set value {shift:0,z:0}
scoreboard players operation z map /= #18 calc.DSC
scoreboard players add z map 1
execute if score z map matches 22.. run scoreboard players set z map 21
execute store result storage map:main num.z int 1 run scoreboard players operation z map *= #6 calc.DSC

execute if dimension overworld run return run function map:render/player/__insert_text with storage map:main num
execute if dimension the_nether run return run function map:render/player/__insert_text_nether with storage map:main num
execute if dimension the_end run return run function map:render/player/__insert_text_end with storage map:main num