scoreboard players set @s died.spectating -1
scoreboard players operation $this team = @s team
tag @s add __targets
execute as @a[gamemode=!spectator] if score @s team = $this team run function dsc:main/player/death/spectate/random_teammate
tag @s remove __targets
execute if score @s died.spectating matches ..-1 run tp @s 0-0-0-0-9