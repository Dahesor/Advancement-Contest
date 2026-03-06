function dsc:player/uid/get

#Show Public Page for spectators
execute unless score on main matches 1.. run return run function dsc:menu/tasks/public
execute unless entity @s[scores={team=1..}] run return run function dsc:menu/tasks/public

execute if score @s task_client_session < @s task_build_ver run function dsc:menu/tasks/gen
execute if score @s task_client_session >= @s task_build_ver run data modify storage temp dialog.dialog set from storage main: player[0].task.build

scoreboard players set @s screen 2
scoreboard players operation @s task_client_session = @s task_build_ver
function dsc:menu/any with storage temp dialog
