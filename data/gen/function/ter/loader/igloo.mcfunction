#41

scoreboard players set next gen 1
scoreboard players set phase gen 30

execute unless data storage gen b_fetch{success:true} run return fail
tellraw @a [{text:"\n[gen:main] 尝试决定放置一个雪屋",color:"dark_gray"}]
function gen:ter/place/call

data modify storage gen place merge from storage gen b_fetch.result
data modify storage gen place.id set value "igloo"
data modify storage gen place.fallback set value 42