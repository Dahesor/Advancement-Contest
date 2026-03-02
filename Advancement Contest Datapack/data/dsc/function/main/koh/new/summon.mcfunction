data modify storage dlm: ticket set value {life:{type:"wait",time:10}}
execute positioned ~-1 ~ ~-1 summon marker run function dsc:main/koh/new/get_load_area
scoreboard players operation #temp calc.DSC = HILL_DURATION main
scoreboard players add #temp calc.DSC 400
execute store result storage dlm: ticket.life.time int 1 run scoreboard players get #temp calc.DSC
execute unless function dlm:new_ticket run say failed ticket!

summon marker ~ ~ ~ {Tags:["koh","__koh.loading"]}