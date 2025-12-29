execute if score $koh_loaded main matches 0 if function dsc:main/koh/new/check_load run function dsc:main/koh/new/loaded
execute if score $koh_loaded main matches 1 as @e[type=marker,tag=koh,limit=1] at @s run function dsc:main/koh/run/marker
execute if score $koh_loaded main matches 1 if score hill_time main matches 1 run function dsc:main/koh/next
execute if score hill_time main matches 1.. run scoreboard players remove hill_time main 1