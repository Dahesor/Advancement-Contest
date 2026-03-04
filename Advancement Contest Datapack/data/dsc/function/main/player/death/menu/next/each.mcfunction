execute store result score #elapsed calc.DSC run scoreboard players operation #next_wave calc.DSC = $gametime calc.DSC
execute store result score #start_time calc.DSC run data get storage team: outpost.this[0].start_time
scoreboard players operation #elapsed calc.DSC -= #start_time calc.DSC

scoreboard players operation #wait_time calc.DSC = OUTPOST_WAVE_TIME main
scoreboard players operation #elapsed calc.DSC %= OUTPOST_WAVE_TIME main
scoreboard players operation #wait_time calc.DSC -= #elapsed calc.DSC

execute store result storage team: outpost.this[0].next_spawn int 1 run scoreboard players operation #next_wave calc.DSC += #wait_time calc.DSC
scoreboard players operation #next_update calc.DSC < #next_wave calc.DSC

data modify storage team: outpost.this append from storage team: outpost.this[0]
data remove storage team: outpost.this[0]
scoreboard players remove #i calc.DSC 1
execute if score #i calc.DSC matches 1.. run function dsc:main/player/death/menu/next/each