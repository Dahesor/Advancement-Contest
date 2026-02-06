function map:scanner/locater

scoreboard players set __map_complete map 0

execute unless score this_map map matches 1.. in overworld run function map:scanner/main_entry with storage run coords
execute if score this_map map matches 1 in the_nether run function map:scanner/main_entry with storage run coords
execute if score this_map map matches 2 in the_end run function map:scanner/main_entry with storage run coords

execute if score __map_complete map matches 1 run function map:scanner/ctrl/next_map