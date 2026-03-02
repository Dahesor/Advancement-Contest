data modify storage team outpost.ztemp set value {x:0,y:0,z:0,id:-1,state:3}
execute store result storage team outpost.ztemp.x int 1 run scoreboard players get @s died.locked_x
execute store result storage team outpost.ztemp.y int 1 run scoreboard players get @s died.locked_y
execute store result storage team outpost.ztemp.z int 1 run scoreboard players get @s died.locked_z

execute if score @s died.expected_time = $gametime calc.DSC run return run function dsc:main/player/death/op/respawn/go

scoreboard players operation #time_left calc.DSC = @s died.expected_time
scoreboard players operation #time_left calc.DSC -= $gametime calc.DSC

scoreboard players operation #whole calc.DSC = #time_left calc.DSC
scoreboard players operation #whole calc.DSC %= #20 calc.DSC

scoreboard players remove #time_left calc.DSC 1
scoreboard players operation #time_left calc.DSC /= #20 calc.DSC
scoreboard players add #time_left calc.DSC 1

title @s times 0 10 0
title @s title ""
title @s subtitle {score:{name:"#time_left",objective:"calc.DSC"},color:"red"}
execute if score #whole calc.DSC matches 0 run playsound ui.button.click master @s ~ ~ ~ 1 1.8

function dsc:main/player/death/op/__tp_to_spawn with storage team outpost.ztemp