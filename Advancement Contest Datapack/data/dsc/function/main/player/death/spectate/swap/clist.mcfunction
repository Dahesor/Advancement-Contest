execute unless data storage run list2[0] run return fail
data modify storage run list append value 0
execute store result storage run list[-1] int -1 run data get storage run list2[0]
data remove storage run list2[0]
function dsc:main/player/death/spectate/swap/clist