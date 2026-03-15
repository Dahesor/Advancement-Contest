execute at @s run playsound ui.button.click master @s ~ ~ ~ 1 1.4 1
scoreboard players add @s task_build_ver 1

function dsc:player/uid/get
execute store result score #skip calc.DSC run data get storage main: player[0].task.looking_at
scoreboard players operation #skip calc.DSC -= TASKLINE_PER_PAGE calc.DSC
execute if score #skip calc.DSC matches ..0 run scoreboard players set #skip calc.DSC 0
data modify storage main: player[0].task.looking_at set value 0
execute store result storage main: player[0].task.looking_at int 1 run scoreboard players get #skip calc.DSC

function dsc:menu/tasks/bar/render/render
function dsc:menu/tasks/make