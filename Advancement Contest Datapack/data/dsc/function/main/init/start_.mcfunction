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
tag @a[scores={team=1..}] add __give_map
execute as @a[scores={team=1..},sort=random] run function dsc:main/init/map/player

#Spawn Players
data modify storage run temp set value {angle:0}
execute as @a[scores={team=1..}] run function dsc:main/init/countdown/spawn_self

#misc
scoreboard players operation expected_player_count main = starting_player_count main
data modify storage team filled_map set value [{team:"red",status:"unknown"},{team:"green",status:"unknown"},{team:"blue",status:"unknown"},{team:"yellow",status:"unknown"},{team:"light_purple",status:"unknown"},{team:"white",status:"unknown"},{team:"gold",status:"unknown"},{team:"gray",status:"unknown"}]

#Expand Worldborder
#data modify storage run temp set value {time:0}
#execute store result storage run temp.time int 1 run scoreboard players get LENGTH_SECTOIN_1 main
function dsc:main/init/countdown/__world_border


#Stages
function dsc:main/koh/pick/port

#Bounty
scoreboard objectives setdisplay list player_bounty
scoreboard objectives modify player_bounty displayname {text:"赏金"}