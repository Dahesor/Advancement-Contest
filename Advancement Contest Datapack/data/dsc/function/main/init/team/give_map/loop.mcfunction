execute if score #loop_count calc.DSC matches ..0 run return fail
data modify storage team: misc.color set from storage team: filled_map[0].team
execute store result score $map_id calc.DSC run data get storage team: filled_map[0].id
function dsc:core/relate/team__score
execute as @a if score @s team = $this team run tag @s add __give_map
function dsc:main/init/map/give_item
tag @a remove __give_map

scoreboard players remove #loop_count calc.DSC 1
data modify storage team: filled_map append from storage team: filled_map[0]
data remove storage team: filled_map[0]
function dsc:main/init/team/give_map/loop