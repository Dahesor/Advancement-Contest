#Input: $map_id calc

function dsc:main/init/map/setup
execute at 0-0-0-0-9 positioned ~4 300 ~4 run data modify block ~ ~ ~ Items set value [{id:"paper",Slot:0b},{id:"paper",Slot:1b},{id:"paper",Slot:2b},{id:"paper",Slot:3b},{id:"filled_map",Slot:4b,components:{"minecraft:map_id":1}},{id:"paper",Slot:5b},{id:"paper",Slot:6b},{id:"paper",Slot:7b},{id:"paper",Slot:8b}]

execute at 0-0-0-0-9 positioned ~4 300 ~4 store result block ~ ~ ~ Items[{Slot:4b}].components."minecraft:map_id" int 1 run scoreboard players get $map_id calc.DSC