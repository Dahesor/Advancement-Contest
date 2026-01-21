function dsc:main/plugin/drop/enter
scoreboard players reset @s death
gamemode spectator
tag @s add dead
tag @s add __dead_prepare
scoreboard players set @s died.revive_target -1
scoreboard players set @s died.expected_time -1
function dsc:main/player/death/op/find/available

#
scoreboard players operation @s revive_time = BASE_RESPAWN_TIME main