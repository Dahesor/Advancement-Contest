scoreboard players set next gen 10
scoreboard players set phase gen -202

scoreboard players set success gen 0
function gen:ter/place/__place with storage gen place

data modify storage gen gen_log prepend value [{text:"\n[gen:place] 开始尝试放置",color:"gray"},{storage:"gen",nbt:"place.id"}," in ",{storage:"gen",nbt:"place.in"}, " at (",{storage:"gen",nbt:"place.x",color:"light_purple"},", ",{storage:"gen",nbt:"place.z",color:"light_purple"},")"]