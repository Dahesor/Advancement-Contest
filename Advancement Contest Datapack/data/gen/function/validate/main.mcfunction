execute unless score #vmo.dz calc.DSC matches 50.. run scoreboard players set #vmo.dz calc.DSC 114
scoreboard players add #vmo.dx calc.DSC 114
execute if score #vmo.dx calc.DSC matches 1024.. run scoreboard players add #vmo.dz calc.DSC 114
execute if score #vmo.dx calc.DSC matches 1024.. run data modify storage gen validate_log append value "\n"
execute if score #vmo.dx calc.DSC matches 1024.. run scoreboard players set #vmo.dx calc.DSC 114
execute if score #vmo.dz calc.DSC matches 1024.. run return run function gen:validate/read_result


scoreboard players operation #vmo.t_x calc.DSC = #vmo.x calc.DSC
scoreboard players operation #vmo.t_x calc.DSC += #vmo.dx calc.DSC
scoreboard players operation #vmo.t_z calc.DSC = #vmo.z calc.DSC
scoreboard players operation #vmo.t_z calc.DSC += #vmo.dz calc.DSC

scoreboard players add #vmo.count calc.DSC 1
scoreboard players set #vmo.result calc.DSC 0
execute store result storage run to.x int 1 run scoreboard players get #vmo.t_x calc.DSC
execute store result storage run to.z int 1 run scoreboard players get #vmo.t_z calc.DSC

execute store result score #time calc.DSC run stopwatch query gen:validate 1000
function gen:validate/__get_reading with storage run to
execute store result score #used_time calc.DSC run stopwatch query gen:validate 1000
scoreboard players operation #used_time calc.DSC -= #time calc.DSC

data modify storage gen validate_log append value {text:"█",color:"red"}
execute if score #vmo.result calc.DSC matches 10.. run scoreboard players add #vmo.success calc.DSC 1
execute if score #vmo.result calc.DSC matches 10.. run data modify storage gen validate_log[-1].color set value "green"

schedule function gen:validate/to_origin 2t
execute if score #used_time calc.DSC matches 50.. run schedule function gen:validate/to_origin 5t replace
execute if score #used_time calc.DSC matches 200.. run schedule function gen:validate/to_origin 1s replace

data modify storage map:main dialog.dialog set value {type:"notice",title:"寻找游戏场地……",can_close_with_escape:false,pause:false,after_action:"none",action:{label:""},body:{type:"plain_message",contents:[""]}}
data modify storage map:main dialog.dialog.body.contents set from storage gen validate_log
function dsc:menu/any_forall with storage map:main dialog