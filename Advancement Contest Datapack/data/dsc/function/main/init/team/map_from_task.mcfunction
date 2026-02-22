execute unless data storage team map_task[0] run return run function dsc:main/init/prepare/build_map_complete

scoreboard players set #map_scale calc.DSC 0
execute store result score $map_id calc.DSC run data get storage team map_task[0].initial
function dsc:main/init/map/start
schedule function dsc:main/init/team/wait_map 1t