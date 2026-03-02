execute unless data storage run list[0] run return fail

execute store result score #temp calc.DSC run data get storage run list[0]
data remove storage run list[0]

execute if score #temp calc.DSC >= #base died.spectating run return run function dsc:main/player/death/spectate/swap/find_lower
execute if score #temp calc.DSC <= #result UID run return run function dsc:main/player/death/spectate/swap/find_lower

scoreboard players operation #result UID = #temp calc.DSC
scoreboard players set #has_result died.spectating 1
function dsc:main/player/death/spectate/swap/find_lower