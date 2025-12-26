scoreboard players set next gen 0
scoreboard players set phase gen 30

scoreboard players add $exe gen 1
execute if score $exe gen matches 1 run return run function gen:ter/loader/__mansion
execute if score $exe gen matches 2 run return run function gen:ter/loader/__p_outpost
execute if score $exe gen matches 3 run return run function gen:ter/loader/trial_chamber
execute if score $exe gen matches 4 run return run function gen:ter/loader/__desert_py
execute if score $exe gen matches 5 run return run function gen:ter/loader/__jungle_py
execute if score $exe gen matches 6 run return run function gen:ter/loader/__igloo
execute if score $exe gen matches 7 run return run function gen:ter/loader/__ocean

scoreboard players set phase gen 100