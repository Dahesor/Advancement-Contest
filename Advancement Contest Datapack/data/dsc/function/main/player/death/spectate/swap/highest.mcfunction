execute unless data storage run list2[0] run return fail
execute store result score #temp calc.DSC run data get storage run list2[0]
execute if score #temp calc.DSC > #result UID run scoreboard players operation #result UID = #temp calc.DSC
data remove storage run list2[0]
function dsc:main/player/death/spectate/swap/highest