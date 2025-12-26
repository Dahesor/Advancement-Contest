scoreboard players set next gen 0
scoreboard players set phase gen -203

function gen:ter/place/__tp with storage gen place
scoreboard players remove $wait gen 1
execute if score $wait gen matches ..1 run scoreboard players set phase gen -201