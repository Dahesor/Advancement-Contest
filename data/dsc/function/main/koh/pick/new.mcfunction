scoreboard players operation #this_angle calc.DSC += #koh_angle main
execute store result score $rand calc.DSC run random value 1..10000000
scoreboard players operation $rand calc.DSC %= #koh_angle_offset main
scoreboard players operation #this_angle calc.DSC += $rand calc.DSC

data modify storage koh locations append value {radius:0,theta:0}
execute store result storage koh locations[-1].theta int 1 run scoreboard players get #this_angle calc.DSC

execute store result storage koh locations[-1].radius int 1 run random value 200..400

scoreboard players remove #hill_amount main 1
execute if score #hill_amount main matches 1.. run function dsc:main/koh/pick/new