execute if score $this input matches ..99 run return fail
execute unless score @s task_build_ver = @s task_client_session run return run function dsc:menu/tasks/make
execute at @s run playsound ui.button.click master @s ~ ~ ~ 1 2 1

function dsc:player/uid/get

data modify storage run i set value {index:0}
execute store result storage run i.index int 1 run scoreboard players remove $this input 100
function dsc:menu/tasks/bar/pin/__get_entry with storage run i
function dsc:menu/tasks/bar/pin/toggle
function dsc:menu/tasks/bar/build
function dsc:menu/tasks/make