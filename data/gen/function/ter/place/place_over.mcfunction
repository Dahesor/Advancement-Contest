scoreboard players set next gen 0
scoreboard players set phase gen -1

execute store result score phase gen run data get storage gen place.fallback
execute if score success gen matches 1 run data modify storage gen place.success set value true
execute if score success gen matches 0 run data modify storage gen place.success set value false

execute if score success gen matches 1 run tellraw @a [{text:"[gen:place] 成功放置",color:"dark_gray"},{storage:"gen",nbt:"place.id",color:"light_purple"}]
execute if score success gen matches 0 run tellraw @a [{text:"[gen:place] 未能成功放置",color:"dark_gray"},{storage:"gen",nbt:"place.id"}]

execute if score success gen matches 0 run return run function gen:ter/place/retry

tp @a ~ ~5 ~