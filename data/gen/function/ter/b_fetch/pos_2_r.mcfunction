scoreboard players set phase gen -1
scoreboard players set next gen 0
execute store result score phase gen run data get storage gen b_fetch.fallback
function gen:locate/core/read
execute if score warning gen matches 1.. run scoreboard players set next gen 5

execute unless score in_range gen matches 1.. run return run function gen:ter/b_fetch/single

scoreboard players operation $2x gen = x gen
scoreboard players operation $2z gen = z gen

function gen:ter/b_fetch/calc_random

data modify storage gen b_fetch merge value {success:true,result:{x:0,z:0}}
execute store result storage gen b_fetch.result.x int 1 run scoreboard players get $dx gen
execute store result storage gen b_fetch.result.z int 1 run scoreboard players get $dz gen
tellraw @a [{text:"[gen:fetch] 返回了可用的放置地点：",color:"dark_gray"},"(",{score:{name:"$dx",objective:"gen"},color:"green"},", ",{score:{name:"$dz",objective:"gen"},color:"green"},")"]