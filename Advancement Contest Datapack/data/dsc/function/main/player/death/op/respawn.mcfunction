tag @s remove respawning
tag @s remove dead
tag @s remove __dead_prepare
tag @s remove spawn_locked
tag @s remove spawn_locked
scoreboard players reset @s died.spectating
scoreboard players reset @s key.a
scoreboard players reset @s key.d
scoreboard players reset @s key.space
scoreboard players reset @s died.swap_cd
scoreboard players reset @s died.revive_target
scoreboard players reset @s died.expected_time
scoreboard players set @s revive_time 0
tag @s remove respawn_menu
function dsc:main/player/death/op/__tp_to_spawn with storage team: outpost.ztemp
execute at @s run playsound item.totem.use master @a ~ ~ ~ 0.9 1.3
execute at @s run particle totem_of_undying ~ ~1 ~ 0.3 0.3 0.3 1 100 normal @a
gamemode survival