execute store result score $result_map_id calc.DSC run data get entity @s Item.components."minecraft:map_id"
execute at 0-0-0-0-9 positioned ~4 300 ~4 run setblock ~1 ~ ~ air
scoreboard players set #map_done calc.DSC 1
kill