execute as @e[type=marker,tag=koh,limit=1] at @s run function dsc:main/koh/destroy
scoreboard players set $koh_loaded main -1

scoreboard players set stage main 3
scoreboard players set drop_rate main 75
scoreboard players set elimination main 1
function dsc:main/announce/border_shrink

execute in overworld run worldborder set 48 900s
execute in the_nether run worldborder set 48 450s