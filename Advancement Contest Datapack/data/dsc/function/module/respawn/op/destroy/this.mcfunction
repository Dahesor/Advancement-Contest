execute if block ~ ~ ~ beacon run setblock ~ ~ ~ air

#Get its outpost id
scoreboard players operation $this outpost = @s outpost

#Notify players that are spectating this outpost
scoreboard players operation #negat outpost = $this outpost
scoreboard players operation #negat outpost *= #-1 calc.DSC
execute as @a if score @s died.spectating = #negat outpost run scoreboard players set @s died.spectating 0

#Update respawn target
execute unless score @s outpost.state matches -999 as @a[gamemode=spectator,scores={team=1..},tag=!aced,tag=!eliminated] if score @s died.revive_target = $this outpost run function dsc:main/player/death/op/find/ban


scoreboard players operation $this team = @s team
execute as @a[tag=respawn_menu] if score @s team = $this team at @s run function dsc:main/player/death/op/update_spawn


execute on vehicle if entity @s[type=item_display] run function dsc:module/respawn/op/destroy/destroy_display

data modify storage custom data set from entity @s data

function dsc:module/respawn/op/destroy/__remove_marker with storage custom data.outpost
fill ~ ~1 ~ ~ ~2 ~ air replace moving_piston
function dsc:module/respawn/op/destroy/__remove_entry with storage custom data.outpost
kill