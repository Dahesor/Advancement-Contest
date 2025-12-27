tag @s remove __new_ac
waypoint modify @s style set dsc:op
execute if score #new team matches 1 run return run waypoint modify @s color red
execute if score #new team matches 2 run return run waypoint modify @s color green
execute if score #new team matches 3 run return run waypoint modify @s color blue
execute if score #new team matches 4 run return run waypoint modify @s color yellow
execute if score #new team matches 5 run return run waypoint modify @s color light_purple
execute if score #new team matches 6 run return run waypoint modify @s color white
execute if score #new team matches 7 run return run waypoint modify @s color gold
execute if score #new team matches 8 run return run waypoint modify @s color gray
