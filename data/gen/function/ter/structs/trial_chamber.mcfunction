#12
scoreboard players set next gen 1
scoreboard players set phase gen 12
execute unless score has_trial_chamber gen matches 1.. run scoreboard players set has_trial_chamber gen 0

execute unless score $find gen matches 1.. run scoreboard players set $find gen 0
execute if score $find gen matches 0 run return run function gen:ter/structs/__trial_chamber

execute if score $trial gen matches 4 run scoreboard players set phase gen 13
scoreboard players set next gen 0
scoreboard players set $find gen 0
function gen:locate/core/read
execute if score warning gen matches 1.. run scoreboard players set next gen 5
execute unless score in_range gen matches 1.. run return fail

#Found
data modify storage map:main dec_temp set from storage map:main dec
data modify storage map:main single_dec set value {x:0,z:0,char:"t"}
execute store result storage map:main single_dec.x int 1 run scoreboard players get x gen
execute store result storage map:main single_dec.z int 1 run scoreboard players get z gen
execute store result score $_temp gen run data get storage map:main dec_temp
execute store result score $total gen run data modify storage map:main dec_temp[] set from storage map:main single_dec

execute unless score $_temp gen = $total gen run return fail

scoreboard players add has_trial_chamber gen 1
data modify storage map:main dec append from storage map:main single_dec