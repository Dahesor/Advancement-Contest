function dsc:player/uid/get
data modify storage run old_build set value {}
data modify storage run old_build set from storage main: player[0].task.result

data modify storage main: player[0].task.result set from storage main: player[0].task.raw

execute unless score @s team matches 1.. run data remove storage main: player[0].task.result[].pin

data modify storage temp l set from storage main: player[0].task.pin
function dsc:menu/tasks/bar/pin/proc_pin
data modify storage temp l set from storage main: player[0].task.unpin
function dsc:menu/tasks/bar/pin/proc_unpin

data modify storage temp l set value []
data modify storage temp l append from storage main: player[0].task.result[{node:"challenge"}]
data remove storage main: player[0].task.result[{node:"challenge"}]
data modify storage main: player[0].task.result append from storage temp l[]

execute unless score @s team matches 1.. run function dsc:menu/tasks/bar/discard_completed

data modify storage temp l set value []
data modify storage temp l append from storage main: player[0].task.result[{pin:true}]
data modify storage temp e set from storage main: player[0].task.pin
function dsc:menu/tasks/bar/pin/parse_pins
data remove storage main: player[0].task.result[{pin:true}]
data modify storage main: player[0].task.result prepend from storage temp l[]

execute store result score #success calc.DSC run data modify storage run old_build set from storage main: player[0].task.result
execute if score #success calc.DSC matches 1.. run scoreboard players add @s task_build_ver 1

function dsc:menu/tasks/bar/render/render