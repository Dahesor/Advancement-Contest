scoreboard players set HILL_AMOUNT main 6


scoreboard players operation #hill_amount main = HILL_AMOUNT main
data modify storage koh locations set value [{radius:0,theta:0}]
scoreboard players remove #hill_amount main 1

scoreboard players set #koh_angle main 360
scoreboard players operation #koh_angle main /= #hill_amount main
scoreboard players operation #koh_angle_offset main = #koh_angle main
scoreboard players operation #koh_angle_offset main /= #10 calc.DSC
scoreboard players operation #koh_angle main -= #koh_angle_offset main
scoreboard players operation #koh_angle_offset main += #koh_angle_offset main

scoreboard players set #this_angle calc.DSC 0
execute if score #hill_amount main matches 1.. run function dsc:main/koh/pick/new
#Shuffle
data modify storage koh temp set from storage koh locations
data modify storage koh locations set value []
data modify storage run num set value {i:0}
execute if data storage koh temp[0] run function dsc:main/koh/pick/shuffle