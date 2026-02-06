scoreboard players set next gen 0
scoreboard players set phase gen -203

function gen:ter/place/__tp with storage gen place
scoreboard players set $wait gen 120
scoreboard players set $attempt gen 1

data modify storage gen gen_log prepend value [{text:"\n[gen:place] 开始加载地形",color:"gray"}," in ",{storage:"gen",nbt:"place.in"}, " at (",{storage:"gen",nbt:"place.x",color:"light_purple"},", ",{storage:"gen",nbt:"place.z",color:"light_purple"},")"]
