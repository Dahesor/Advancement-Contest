scoreboard players set phase gen 4
scoreboard players set next gen 0

execute store result score vil_count gen run data get storage gen vil.m
data modify storage gen gen_log prepend value [{text:"\n[gen:main] 游戏区域内找到了",color:"gray"},{score:{name:"vil_count",objective:"gen"},color:"green"},"个村庄"]

execute if data storage gen vil.m[0] run data modify storage map:main dec append from storage gen vil.m[]
execute if data storage gen vil.m[0] run data modify storage map:main dec[].char set value "v"

scoreboard players set $vil_place gen 0
execute store result score $target_vil gen run random value 2..4

execute if score vil_count gen >= $target_vil gen run return run scoreboard players set phase gen 10

