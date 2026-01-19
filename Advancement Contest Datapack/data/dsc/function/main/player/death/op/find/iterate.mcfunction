execute store result score #state calc.DSC run data get storage team outpost.this[0].state
execute if score #state calc.DSC matches 3 run return run function dsc:main/player/death/op/find/next

execute store result score @s died.revive_target run data get storage team outpost.this[0].id

execute store result score #elapsed calc.DSC run scoreboard players operation #next_wave calc.DSC = $gametime calc.DSC
execute store result score #start_time calc.DSC run data get storage team outpost.this[0].start_time
scoreboard players operation #elapsed calc.DSC -= #start_time calc.DSC

scoreboard players operation #wait_time calc.DSC = OUTPOST_WAVE_TIME main
scoreboard players operation #elapsed calc.DSC %= OUTPOST_WAVE_TIME main
scoreboard players operation #wait_time calc.DSC -= #elapsed calc.DSC

execute store result score @s died.expected_time run scoreboard players operation #next_wave calc.DSC += #wait_time calc.DSC