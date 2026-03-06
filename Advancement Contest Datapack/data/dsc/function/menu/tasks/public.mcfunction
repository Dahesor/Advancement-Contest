execute unless score @s task_build_ver matches 1.. run function dsc:menu/tasks/bar/pull



execute if score @s task_client_session < @s task_build_ver run function dsc:menu/tasks/gen
execute if score @s task_client_session >= @s task_build_ver run data modify storage temp dialog.dialog set from storage main: player[0].task.build

#Display
    scoreboard players set @s screen 2
    scoreboard players operation @s task_client_session = @s task_build_ver
    function dsc:menu/any with storage temp dialog
