data modify storage team: filled_map append value {id:-1,status:"complete"}
data modify storage team: filled_map[-1].team set from storage team: map_task[0].for_team
execute store result storage team: filled_map[-1].id int 1 run scoreboard players get $result_map_id calc.DSC

data remove storage team: map_task[0]
function dsc:main/init/team/map_from_task