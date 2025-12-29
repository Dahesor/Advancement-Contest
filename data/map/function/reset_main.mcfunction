data modify storage map:main main set value {data:[],origin:{x:0,z:0},size:64}
execute store result storage map:main main.origin.x int 1 run scoreboard players get origin_x map
execute store result storage map:main main.origin.z int 1 run scoreboard players get origin_z map
execute store result storage map:main main.size int 1 run scoreboard players get size map

scoreboard players operation list_depth map = size map
scoreboard players operation list_depth map *= size map
scoreboard players operation __lookup map = list_depth map
scoreboard players operation __lookup map /= #32 calc.DSC

scoreboard players set __cx map 0
scoreboard players set __cz map 0
scoreboard players set SAMPLE_MAX map 24

data modify storage run l set value []
scoreboard players set $it map 0
function map:init/x
scoreboard players set $it map 0
function map:init/z


return 1
scoreboard players set origin_x map 0
scoreboard players set origin_z map 0
scoreboard players set size map 64