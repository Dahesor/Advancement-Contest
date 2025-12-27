execute if score @s refreshCD matches 1.. run return fail
tag @s add dsc.mapping
execute at @s run playsound ui.button.click master @s ~ ~ ~ 1 1.8
scoreboard players set @s refreshCD 30