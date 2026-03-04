#If Teammate just fectched
execute if score @s team = #last_spawn_cache team run return run data modify storage team: outpost.this set from storage team: outpost.fetch_cache

#Save Last Cache Info
scoreboard players operation #last_spawn_cache team = @s team

#Check If Need Update
scoreboard players set #next_update calc.DSC 2147483647
function dsc:main/player/death/menu/next/__read_data with storage team: misc
execute if score #next_update calc.DSC > $gametime calc.DSC run return run data modify storage team: outpost.fetch_cache set from storage team: outpost.this

scoreboard players set #next_update calc.DSC 2147483647
execute store result score #i calc.DSC run data get storage team: outpost.this
execute if data storage team: outpost.this[0] run function dsc:main/player/death/menu/next/each
#Save data and cache
data modify storage team: outpost.fetch_cache set from storage team: outpost.this
function dsc:main/player/death/menu/next/__write_data with storage team: misc