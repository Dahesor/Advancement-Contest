data modify storage run death set value {x:0d,y:0d,z:0d,in:""}
execute store result storage run death.x double 1 run data get entity @s Pos[0]
execute store result storage run death.y double 1 run data get entity @s Pos[1]
execute store result storage run death.z double 1 run data get entity @s Pos[2]
data modify storage run death.in set from entity @s Dimension

data modify storage temp Inv set from entity @s Inventory
gamemode spectator

function dsc:main/plugin/drop/__locate with storage run death