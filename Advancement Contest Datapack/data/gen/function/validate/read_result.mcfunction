data modify storage gen gen_log prepend value ["count: ",{"score":{"name":"#vmo.count","objective":"calc.DSC"}}," success: ",{"score":{"name":"#vmo.success","objective":"calc.DSC"}}]

execute if score #vmo.success calc.DSC matches 32.. run return run function dsc:core/initialize/from_auto

scoreboard players add #vmo.x calc.DSC 1024
#scoreboard players set #vmo.z calc.DSC -64

scoreboard players set #vmo.dx calc.DSC 0
scoreboard players set #vmo.dz calc.DSC 0
scoreboard players set #vmo.count calc.DSC 0
scoreboard players set #vmo.success calc.DSC 0
function gen:validate/reset_text
function gen:validate/to_origin