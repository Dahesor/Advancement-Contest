scoreboard players add @s trigger.balanced_diet 1
execute if score @s trigger.balanced_diet matches 20.. run return run advancement grant @s only dsc_adv:husbandry/balanced_diet

data modify storage run int set value {i:0}
execute store result storage run int.i int 1 run scoreboard players get @s trigger.balanced_diet
function dsc:module/adv/trigger/__balanced_diet with storage run int