execute store result score phase gen run data get storage gen b_fetch.fallback
data modify storage gen b_fetch.success set value false

tellraw @a[tag=dev] [{text:"[gen:fetch] 没有在游戏区域内找到合适的放置点",color:"dark_gray"}]