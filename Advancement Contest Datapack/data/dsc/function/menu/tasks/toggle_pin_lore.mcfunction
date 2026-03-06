execute at @s run playsound ui.button.click master @s ~ ~ ~ 1 1.3 1

execute if entity @s[tag=hide_task_lore] run tag @s add __hide_task_lore
tag @s add hide_task_lore
execute if entity @s[tag=__hide_task_lore] run tag @s remove hide_task_lore
tag @s remove __hide_task_lore

scoreboard players add @s task_build_ver 1

function dsc:menu/tasks/bar/render/render
function dsc:menu/tasks/make