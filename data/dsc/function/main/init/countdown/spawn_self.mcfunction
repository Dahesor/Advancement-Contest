gamemode survival @s
execute store result storage run temp.angle int 1 run random value 1..360
function dsc:main/init/countdown/__spawn_self with storage run temp