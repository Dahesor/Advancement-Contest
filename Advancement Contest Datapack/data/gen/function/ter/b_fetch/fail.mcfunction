execute store result score phase gen run data get storage gen b_fetch.fallback
data modify storage gen b_fetch.success set value false

data modify storage gen gen_log prepend value [{text:"\n[gen:fetch] 没有在游戏区域内找到合适的放置点",color:"gray"}]