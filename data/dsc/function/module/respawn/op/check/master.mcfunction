scoreboard players operation $old outpost.state = @s outpost.state

scoreboard players set @s outpost.state 0
execute if entity @a[gamemode=!spectator,scores={team=1..},distance=..75] run function dsc:module/respawn/op/check/player

execute unless score @s outpost.state = $old outpost.state run function dsc:module/respawn/op/check/state_changed