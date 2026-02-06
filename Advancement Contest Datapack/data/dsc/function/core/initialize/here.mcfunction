#Get corner
execute store result score #x calc.DSC run data get entity @s Pos[0]
execute store result score #z calc.DSC run data get entity @s Pos[2]
scoreboard players add #x calc.DSC 64
scoreboard players add #z calc.DSC 64
scoreboard players operation #x calc.DSC /= #1024 calc.DSC
scoreboard players operation #x calc.DSC *= #1024 calc.DSC
scoreboard players operation #z calc.DSC /= #1024 calc.DSC
scoreboard players operation #z calc.DSC *= #1024 calc.DSC
scoreboard players remove #x calc.DSC 64
scoreboard players remove #z calc.DSC 64
function dsc:core/initialize/start_gen