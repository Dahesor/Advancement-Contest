execute if score #loop_20 calc.DSC matches 3 run function dsc:main/koh/run/count
execute if score #loop_20 calc.DSC matches 13 run function dsc:main/koh/run/count
scoreboard players add #next_koh_score main 1
execute if score #next_koh_score main matches 200.. run function dsc:main/koh/run/score