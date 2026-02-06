scoreboard players set phase gen 1
scoreboard players set next gen 0
execute if score vil_z gen matches 512.. run scoreboard players set phase gen 3

function gen:locate/core/read
execute if score warning gen matches 1.. run scoreboard players set next gen 5

execute unless score in_range gen matches 1.. run return fail

execute store result storage gen vil.n.x int 1 run scoreboard players get x gen
execute store result storage gen vil.n.z int 1 run scoreboard players get z gen

execute unless data storage gen vil.m[0].x run data modify storage gen gen_log prepend value [{text:"\n[gen:main] 发现了区域内的新村庄",color:"gray"},"(",{score:{name:"x",objective:"gen"},color:"green"},", ",{score:{name:"z",objective:"gen"},color:"green"},")"]
execute unless data storage gen vil.m[0].x run return run data modify storage gen vil.m append from storage gen vil.n

data modify storage gen vil.a set from storage gen vil.m
execute store result score $total gen run data get storage gen vil.a
execute store result score $_temp gen run data modify storage gen vil.a[] set from storage gen vil.n
execute unless score $total gen = $_temp gen run return fail
data modify storage gen vil.m append from storage gen vil.n
data modify storage gen gen_log prepend value [{text:"\n[gen:main] 发现了区域内的新村庄",color:"gray"},"(",{score:{name:"x",objective:"gen"},color:"green"},", ",{score:{name:"z",objective:"gen"},color:"green"},")"]