schedule function dsc:main/player/misc/map/tasks/main 1t replace
execute unless data storage team map_task[0].for_team run return run schedule clear dsc:main/player/misc/map/tasks/main

execute positioned ~ -64 ~ run function dsc:main/player/misc/map/tasks/block