scoreboard players operation $this input = @s input
scoreboard players set @s input 0
execute if score @s screen matches ..-1 run return run function dsc:menu/trigger/tp
execute if score @s screen matches 1 run return run function dsc:main/player/death/menu/in
execute if score @s screen matches 2 run return run function dsc:menu/tasks/input