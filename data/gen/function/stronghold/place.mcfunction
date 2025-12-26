#200
scoreboard players set next gen 1
scoreboard players set phase gen 200

scoreboard players add $stronghold_attempt gen 1
execute if score $stronghold_attempt gen matches 5.. run return run scoreboard players set phase gen 202

execute if score $stronghold_attempt gen matches 1 run tellraw @a "\n"
tellraw @a [{text:"[gen:main] 开始放置要塞",color:"dark_gray"}," Attepmt (",{score:{name:"$stronghold_attempt",objective:"gen"},color:"red",extra:["/4"]},")"]

function gen:ter/place/call

execute store result score $dx gen run random value -350..350
execute store result score $dz gen run random value -350..350
scoreboard players operation $dx gen += zero_x gen
scoreboard players operation $dz gen += zero_z gen
execute store result storage gen place.x int 1 run scoreboard players get $dx gen
execute store result storage gen place.z int 1 run scoreboard players get $dz gen

data modify storage gen place.id set value "stronghold"
data modify storage gen place.fallback set value 201