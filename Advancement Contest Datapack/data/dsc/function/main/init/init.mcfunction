execute as @a run attribute @s block_interaction_range modifier remove gen:block
function dsc:main/init/centers
scoreboard players set stage main -1
scoreboard players reset @a death
execute as @a run attribute @s waypoint_transmit_range base set 0
execute in overworld run worldborder set 47
execute in the_nether run worldborder set 1024
execute in the_end run worldborder set 512
execute in overworld run worldborder damage buffer 0.2
execute in the_nether run worldborder damage buffer 0.2
execute in the_end run worldborder damage buffer 0
execute in overworld run worldborder damage amount 1
execute in the_nether run worldborder damage amount 1
execute in the_end run worldborder damage amount 1
execute in overworld run worldborder warning distance 2
execute in the_nether run worldborder warning distance 2
execute in the_end run worldborder warning distance 2
function map:reset_main
execute positioned over motion_blocking_no_leaves positioned ~-23 ~ ~-23 run place template gen:center

schedule function dsc:main/init/countdown/10 1t
schedule function dsc:main/init/countdown/5 5s
schedule function dsc:main/init/countdown/4 6s
schedule function dsc:main/init/countdown/3 7s
schedule function dsc:main/init/countdown/2 8s
schedule function dsc:main/init/countdown/1 9s
schedule function dsc:main/init/countdown/start 10s

data modify storage team: track_list.team set value [{team:"blue",data:[]},{team:"red",data:[]},{team:"green",data:[]},{team:"gold",data:[]},{team:"gray",data:[]},{team:"light_purple",data:[]},{team:"yellow",data:[]},{team:"white",data:[]}]
data modify storage team: track_list.team[].data set from storage team: track_list.cache

execute as @a[scores={team=1..}] run function dsc:menu/tasks/bar/pull
execute as @a[scores={team=1..}] run function dsc:player/bossbar/show_self

execute positioned over motion_blocking run tp @a[team=] ~ ~5 ~