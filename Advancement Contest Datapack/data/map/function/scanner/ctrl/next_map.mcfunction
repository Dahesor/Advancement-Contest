#Save previous map data
execute unless score zthis_map map matches 1.. run data modify storage map:main overworld set from storage map:main main
execute if score zthis_map map matches 1 run data modify storage map:main the_nether set from storage map:main main
execute if score zthis_map map matches 2 run data modify storage map:main the_end set from storage map:main main


#Map switch
scoreboard players add zthis_map map 1
execute if score zthis_map map matches 1 in the_nether unless entity @a[gamemode=!spectator,distance=0..] run scoreboard players add zthis_map map 1
execute if score zthis_map map matches 2 in the_end unless entity @a[gamemode=!spectator,distance=0..] run scoreboard players add zthis_map map 1
execute if score zthis_map map matches 3.. run scoreboard players set zthis_map map 0

#Load new map data
execute unless score zthis_map map matches 1.. run data modify storage map:main main set from storage map:main overworld
execute if score zthis_map map matches 1 run data modify storage map:main main set from storage map:main the_nether
execute if score zthis_map map matches 2 run data modify storage map:main main set from storage map:main the_end

scoreboard players operation max_sample map = SAMPLE_MAX map
scoreboard players operation max_sample map /= #2 calc.DSC

scoreboard players set SAMPLER map 0
execute if score zthis_map map matches 1 run scoreboard players set SAMPLER map 1