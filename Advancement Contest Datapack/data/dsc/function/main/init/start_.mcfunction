function dsc:main/init/const
weather clear
time set day
recipe take @a *
gamerule block_drops true
function map:reset_main
data modify storage main: online set value []

#Player Setup
scoreboard players set starting_player_count main 0
execute as @a[team=!] run function dsc:core/relate/team_assign_score
execute as @a[scores={team=1..},sort=random] run function dsc:main/init/map/player
function dsc:core/util/team/friendly_invisible/on
execute store result score #loop_count calc.DSC run data get storage team: filled_map
function dsc:main/init/team/give_map/loop

#Spawn Players
data modify storage run temp set value {angle:0}
execute as @a[scores={team=1..}] run function dsc:main/init/countdown/spawn_self

#misc
scoreboard players operation expected_player_count main = starting_player_count main

#Expand Worldborder
#data modify storage run temp set value {time:0}
#execute store result storage run temp.time int 1 run scoreboard players get LENGTH_SECTOIN_1 main
function dsc:main/init/countdown/__world_border


#Stages
function dsc:main/koh/pick/port

#Bounty
scoreboard objectives setdisplay list player_bounty
scoreboard objectives modify player_bounty displayname {text:"赏金"}
recipe give @a *
execute as @a[scores={team=1..}] run function dsc_recipe:init_remove/take
execute as @a run function dsc:menu/tasks/bar/pull