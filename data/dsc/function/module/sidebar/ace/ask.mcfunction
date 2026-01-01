data modify storage team outpost.run set from storage team outpost.this
data remove storage team outpost.run[{state:3}]
execute if data storage team outpost.run[0] run return fail
execute as @a[tag=!dead] if score @s team = $this team run return fail

#Aced
execute as @a if score @s team = $this team run function dsc:main/player/death/ace/confirm
#Remove spawns
data modify storage team misc.op_del set value {id:-1,team:"red"}
function dsc:core/relate/score__team

execute unless score elimination main matches 1.. run function dsc:module/sidebar/ace/tell
execute if score elimination main matches 1.. run function dsc:module/sidebar/ace/eliminate

execute as @s at @s run playsound entity.ender_dragon.ambient master @s

execute if data storage team outpost.this[0] run function dsc:module/sidebar/ace/remove_op
