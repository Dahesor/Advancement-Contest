scoreboard players set phase gen -101
scoreboard players set next gen 1
tellraw @a [{text:"\n[gen:fetch] 开始查找可用的放置点",color:"dark_gray"}]

data modify storage gen l set value {}
data merge storage gen {l:{type:"biome",id:"the_void",x:0,z:0}}
data modify storage gen l.id set from storage gen b_fetch.id
function gen:locate/core/find
