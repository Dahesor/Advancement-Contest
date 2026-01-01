scoreboard players set next gen 0
scoreboard players set phase gen -203

function gen:ter/place/__tp with storage gen place
scoreboard players set $wait gen 120
scoreboard players set $attempt gen 1

tellraw @a[tag=dev] [{text:"[gen:place] 开始加载地形",color:"dark_gray"}," in ",{storage:"gen",nbt:"place.in"}, " at (",{storage:"gen",nbt:"place.x",color:"light_purple"},", ",{storage:"gen",nbt:"place.z",color:"light_purple"},")"]
