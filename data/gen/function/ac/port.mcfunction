#100
scoreboard players set next gen 0
scoreboard players set phase gen 200
execute unless score has_ancient_city gen matches 1.. run return fail

scoreboard players set next gen 999999
function gen:ac/start