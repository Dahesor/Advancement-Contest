execute as @e[type=marker,tag=koh,limit=1] at @s run function dsc:main/koh/destroy
scoreboard players set $koh_loaded main -1
data remove storage koh locations[0]
execute if data storage koh locations[0] run function dsc:main/koh/new