scoreboard players set phase gen -102
scoreboard players set next gen 0
function gen:locate/core/read
execute if score warning gen matches 1.. run scoreboard players set next gen 5

execute unless score in_range gen matches 1.. run return run function gen:ter/b_fetch/fail

scoreboard players operation $1x gen = x gen
scoreboard players operation $1z gen = z gen