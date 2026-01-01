execute if score elimination main matches 1.. run return run function dsc:main/player/death/eliminate/self

tag @s add aced
tag @s remove respawning
dialog clear @s
scoreboard players operation @s revive_time = ACE_RESPAWN_TIME main

title @s times 10 70 20
title @s title {text:"团灭",color:"red"}
title @s subtitle {text:"一分半后集体复活",color:"red"}