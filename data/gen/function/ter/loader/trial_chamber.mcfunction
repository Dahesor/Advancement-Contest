execute if score has_trial_chamber gen matches 1.. run return fail

tellraw @a [{text:"\n[gen:main] 尝试决定放置一个试炼密室",color:"dark_gray"}]

function gen:ter/place/call

execute store result score $dx gen run random value -450..450
execute store result score $dz gen run random value -450..450
scoreboard players operation $dx gen += zero_x gen
scoreboard players operation $dz gen += zero_z gen
execute store result storage gen place.x int 1 run scoreboard players get $dx gen
execute store result storage gen place.z int 1 run scoreboard players get $dz gen

data modify storage gen place.id set value "trial_chambers"
data modify storage gen place.fallback set value 35