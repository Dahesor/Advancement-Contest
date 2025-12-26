#6
scoreboard players set next gen 1
scoreboard players set phase gen 4

execute if data storage gen place{success:true} run data modify storage map:main dec append from storage gen place
execute if data storage gen place{success:true} run data modify storage map:main dec[-1].char set value "v"

execute if data storage gen place{success:true} run scoreboard players add vil_count gen 1
execute unless score vil_count gen >= $target_vil gen run return 1

scoreboard players set phase gen 10