execute rotated as @s[tag=aced] rotated ~ 0 positioned as 0-0-0-0-9 run tp @s ~ ~ ~ ~ ~

function dsc:main/player/death/keys
function dsc:main/player/death/spectate/verify
execute if entity @s[tag=!aced] run function dsc:main/player/death/actionbar


execute if entity @s[tag=__dead_prepare] run tag @s remove __dead_prepare

execute if score @s revive_time matches 2.. run scoreboard players remove @s revive_time 1
execute if score @s revive_time matches 2 run tag @s[tag=!aced] add respawning
execute if score @s revive_time matches 2 run tag @s[tag=!aced] add respawn_menu
execute if score @s revive_time matches 2 if entity @s[tag=!aced,tag=!spawn_locked] run function dsc:main/player/death/menu/arrange

execute if score #loop_20 calc.DSC matches 13 if entity @s[tag=respawn_menu,tag=!aced] run function dsc:main/player/death/menu/arrange
execute if entity @s[tag=!aced,tag=!respawn_menu,tag=!spawn_locked] if predicate dsc:keys/push/space run function dsc:main/player/death/menu/open

execute if score @s revive_time matches 1 if entity @s[tag=aced] run function dsc:main/player/death/ace/respawn
execute if score @s[tag=!aced] revive_time matches 1 run function dsc:main/player/death/op/find/on_sky
execute unless score @s[tag=!aced] died.revive_target matches -1 if score $gametime calc.DSC > @s died.expected_time run function dsc:main/player/death/op/find/reiterate