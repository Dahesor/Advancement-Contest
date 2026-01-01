title @a times 0 15 10
title @a title ""
title @a subtitle {"text":"游戏开始！","color":"red","bold":true}
clear @a
effect clear @a
effect give @a instant_health 1 5
execute as @a at @s run playsound block.end_portal.spawn master @s
function dsc:module/adv/initialize
weather clear
time set day
recipe take @a *
function map:reset_main

#Player Setup
execute as @a[team=!] run function dsc:core/relate/team_assign_score

#Spawn Players
data modify storage run temp set value {angle:0}
execute as @a[scores={team=1..}] run function dsc:main/init/countdown/spawn_self

#Expand Worldborder
#data modify storage run temp set value {time:0}
#execute store result storage run temp.time int 1 run scoreboard players get LENGTH_SECTOIN_1 main
function dsc:main/init/countdown/__world_border

function dsc:main/init/const

#Stages
function dsc:main/koh/pick/port