#38

scoreboard players set next gen 1
scoreboard players set phase gen 30

execute unless data storage gen place{success:true} run return fail
scoreboard players add has_desert_pyramid gen 1

data modify storage map:main dec append from storage gen place
data modify storage map:main dec[-1].char set value "d"