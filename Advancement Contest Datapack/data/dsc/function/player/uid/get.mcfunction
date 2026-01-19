execute if score @s UID = #UID_GET UID run return 1

scoreboard players operation #UID_GET UID = @s UID

#run UID_GET -> {UID:-1}
execute store result storage run UID_GET.UID int 1 run scoreboard players get #UID_GET UID
function dsc:player/uid/rotate with storage run UID_GET
return 2