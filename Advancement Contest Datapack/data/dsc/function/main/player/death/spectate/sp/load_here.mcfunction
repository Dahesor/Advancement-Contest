data modify storage dlm: ticket set value {life:{type:"wait",time:600},pos:[0,0],to:[0,0]}
data modify storage dlm: ticket.dimension set from storage main: player[0].spectating.in

execute store result score #x calc.DSC run data get storage main: player[0].spectating.x
execute store result score #z calc.DSC run data get storage main: player[0].spectating.z

scoreboard players remove #x calc.DSC 16
scoreboard players remove #z calc.DSC 16
execute store result storage dlm: ticket.pos[0] int 1 run scoreboard players get #x calc.DSC
execute store result storage dlm: ticket.pos[1] int 1 run scoreboard players get #z calc.DSC

scoreboard players add #x calc.DSC 32
scoreboard players add #z calc.DSC 32
execute store result storage dlm: ticket.to[0] int 1 run scoreboard players get #x calc.DSC
execute store result storage dlm: ticket.to[1] int 1 run scoreboard players get #z calc.DSC

function dlm:new_ticket
