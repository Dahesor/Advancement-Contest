scoreboard players operation $this team = @s team

scoreboard players set #state outpost 0
execute as @a[gamemode=!spectator,distance=..25] unless score @s team = $this team run scoreboard players set #state outpost 3
execute if score #state outpost matches 3 run return run function dsc:module/respawn/op/check/locked

execute as @a[gamemode=!spectator,distance=..50] unless score @s team = $this team run scoreboard players set #state outpost 2
execute if score #state outpost matches 2 run return run function dsc:module/respawn/op/check/discovered

execute as @a[gamemode=!spectator,distance=..75] unless score @s team = $this team run scoreboard players set #state outpost 1
execute if score #state outpost matches 1 run return run function dsc:module/respawn/op/check/warning

return fail