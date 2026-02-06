#Save previous map data
execute unless score this_map map matches 1.. run data modify storage map:main overworld set from storage map:main main
execute if score this_map map matches 1 run data modify storage map:main the_nether set from storage map:main main
execute if score this_map map matches 2 run data modify storage map:main the_end set from storage map:main main


#Map switch
scoreboard players add this_map map 1
execute if score this_map map matches 1 in the_nether unless entity @a[gamemode=!spectator,distance=0..] run scoreboard players add this_map map 1
execute if score this_map map matches 2 in the_end unless entity @a[gamemode=!spectator,distance=0..] run scoreboard players add this_map map 1
execute if score this_map map matches 3.. run scoreboard players set this_map map 0

#Load new map data
execute unless score this_map map matches 1.. run data modify storage map:main main set from storage map:main overworld
execute if score this_map map matches 1 run data modify storage map:main main set from storage map:main the_nether
execute if score this_map map matches 2 run data modify storage map:main main set from storage map:main the_end

scoreboard players operation THIS_SAMPLE_MAX map = SAMPLE_MAX map
execute if score this_map map matches 1 run scoreboard players operation THIS_SAMPLE_MAX map /= #2 calc.DSC

scoreboard players set SAMPLER map 0
execute if score this_map map matches 1 run scoreboard players set SAMPLER map 1