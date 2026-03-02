scoreboard players set #result UID -2147483648
function dsc:main/player/death/spectate/swap/find_lower

execute if score #has_result died.spectating matches 1 run return 1

scoreboard players set #result UID -2147483648
function dsc:main/player/death/spectate/swap/highest