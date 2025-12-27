function dsc:main/init/centers
scoreboard players set stage main -1
execute in overworld run worldborder set 47
execute in the_nether run worldborder set 1024
execute in the_end run worldborder set 512

execute positioned over motion_blocking_no_leaves positioned ~-23 ~ ~-23 run place template gen:center

schedule function dsc:main/init/countdown/10 1t
schedule function dsc:main/init/countdown/5 5s
schedule function dsc:main/init/countdown/4 6s
schedule function dsc:main/init/countdown/3 7s
schedule function dsc:main/init/countdown/2 8s
schedule function dsc:main/init/countdown/1 9s
schedule function dsc:main/init/countdown/start 10s