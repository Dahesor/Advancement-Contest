scoreboard players set $koh_loaded main 1
execute as @e[type=marker,limit=1,tag=__koh.loading] at @s positioned over motion_blocking_no_leaves run tp @s ~ ~-1 ~
execute as @e[type=marker,limit=1,tag=__koh.loading] at @s run function dsc:main/koh/new/marker_init