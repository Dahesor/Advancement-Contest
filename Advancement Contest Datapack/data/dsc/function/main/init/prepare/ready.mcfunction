execute store result score $map_id calc.DSC run data get entity @s Inventory[{id:"minecraft:filled_map"}].components."minecraft:map_id"
gamemode spectator
clear @s
execute at @s run playsound entity.experience_orb.pickup master @s
tellraw @s [{translate:"head.game",color:"green"},"您的小队已准备就绪！"]

execute unless entity @s[tag=preparing] run return 1
tag @s remove preparing

scoreboard players operation $this team = @s team
function dsc:core/relate/score__team
function dsc:main/init/prepare/__remove_duplicate with storage team misc
data modify storage team map_task append value {initial:-1}
data modify storage team map_task[-1].for_team set from storage team misc.color
execute store result storage team map_task[-1].initial int 1 run scoreboard players get $map_id calc.DSC

tag @s add __NonInclude
scoreboard players operation $this team = @s team
execute as @a[tag=!__NonInclude] if score @s team = $this team run tag @s remove preparing
execute as @a[tag=!__NonInclude] if score @s team = $this team run function dsc:main/init/prepare/ready
tag @s remove __NonInclude