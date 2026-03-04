execute unless score @s died.revive_target matches 1.. run return fail
scoreboard players operation #time_left calc.DSC = @s died.expected_time
scoreboard players operation #time_left calc.DSC -= $gametime calc.DSC
execute unless score #time_left calc.DSC matches 0..60 run return fail

scoreboard players operation $this team = @s team
function dsc:core/relate/score__team
function dsc:main/player/death/menu/next/__read_data with storage team: misc
data modify storage run num set value {id:0}

execute store result storage run num.id int 1 run scoreboard players get @s died.revive_target
function dsc:main/player/death/menu/__get_spawn_point with storage run num

execute if data storage team: outpost.ztemp{state:3} run return fail
tag @s add spawn_locked
execute store result score @s died.locked_x run data get storage team: outpost.ztemp.x
execute store result score @s died.locked_y run data get storage team: outpost.ztemp.y
execute store result score @s died.locked_z run data get storage team: outpost.ztemp.z

data modify storage dlm: ticket set value {life:{type:"wait",time:100},pos:[0,0],to:[0,0]}
data modify storage dlm: ticket.dimension set from storage main: player[0].spectating.in
scoreboard players operation #x calc.DSC = @s died.locked_x
scoreboard players operation #z calc.DSC = @s died.locked_z
scoreboard players remove #x calc.DSC 16
scoreboard players remove #z calc.DSC 16
execute store result storage dlm: ticket.pos[0] int 1 run scoreboard players get #x calc.DSC
execute store result storage dlm: ticket.pos[1] int 1 run scoreboard players get #z calc.DSC
scoreboard players add #x calc.DSC 32
scoreboard players add #z calc.DSC 32
execute store result storage dlm: ticket.to[0] int 1 run scoreboard players get #x calc.DSC
execute store result storage dlm: ticket.to[1] int 1 run scoreboard players get #z calc.DSC
function dlm:new_ticket


function dsc:main/player/death/menu/close