data modify storage gen b_fetch merge value {success:true,result:{x:0,z:0}}
execute store result storage gen b_fetch.result.x int 1 run scoreboard players get $1x gen
execute store result storage gen b_fetch.result.z int 1 run scoreboard players get $1z gen
tellraw @a[tag=dev] [{text:"[gen:fetch] 返回了可用的放置地点：",color:"dark_gray"},"(",{score:{name:"$1x",objective:"gen"},color:"green"},", ",{score:{name:"$1z",objective:"gen"},color:"green"},")"]