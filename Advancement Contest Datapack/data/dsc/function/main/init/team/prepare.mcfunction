data modify storage team: filled_map set value []
function dsc:main/init/team/map_from_task

return 1
data modify storage team: map_task set value [{for_team:"red",initial:10}]