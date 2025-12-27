execute if entity @s[tag=outpost_init] run function dsc:module/respawn/op/new/initialize

execute unless block ~ ~ ~ beacon run return run function dsc:module/respawn/op/destroy/this

execute unless block ~ ~1 ~ moving_piston run setblock ~ ~1 ~ moving_piston
execute unless block ~ ~2 ~ moving_piston run setblock ~ ~2 ~ moving_piston

execute if score #loop_20 calc.DSC matches 3 run function dsc:module/respawn/op/check/master