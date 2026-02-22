schedule function dsc:main/init/team/wait_map 1t
execute unless score #map_done calc.DSC matches 1.. run return fail

scoreboard players add #map_scale calc.DSC 1
scoreboard players operation $map_id calc.DSC = $result_map_id calc.DSC
execute unless score #map_scale calc.DSC matches 3.. run return run function dsc:main/init/map/start

schedule clear dsc:main/init/team/wait_map
function dsc:main/init/team/next_task