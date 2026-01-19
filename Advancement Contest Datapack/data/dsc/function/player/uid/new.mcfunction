scoreboard players add #NEXT UID 1
scoreboard players operation @s UID = #NEXT UID

data modify storage main: player append value {UID:-1}
execute store result storage main: player[-1].UID int 1 run scoreboard players get @s UID
function dsc:core/math/gu/generate
data modify storage main: player[-1].UUID set from storage gu:main out

#Player Name
tag @s add map.__name
summon text_display ~ ~ ~ {text:{selector:"@a[limit=1,tag=map.__name]"},UUID:[I;0,0,0,1]}
tag @s remove map.__name
data modify storage main: player[-1].Name set from entity 0-0-0-0-1 text.insertion
kill 0-0-0-0-1

#Misc
data modify storage run UID_GET set value {UID:-1}
attribute @s waypoint_transmit_range base set 0