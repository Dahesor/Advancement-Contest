tag @s remove respawning
tag @s remove dead
tag @s remove aced
function dsc:main/player/death/ace/__tp_spawn with storage run res
execute at @s run playsound item.totem.use master @a ~ ~ ~ 0.9 1.3
execute at @s run particle totem_of_undying ~ ~1 ~ 0.3 0.3 0.3 1 100 normal @a
gamemode survival
effect give @s resistance 20 10