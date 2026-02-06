scoreboard players reset @s used.map
function dsc:main/player/misc/map/slot_getter

return fail

function dsc:main/player/misc/map/get_team

execute unless function dsc:main/player/misc/map/slot_getter run return fail

#Check string
data modify storage run string set from storage team filled_map[0].status


