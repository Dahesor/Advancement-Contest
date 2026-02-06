tp @s ~ ~ ~ ~ ~
data modify storage run coord set from entity @s Pos
execute store result score x map run data get storage run coord[0]
execute store result score y map run data get storage run coord[1]
execute store result score z map run data get storage run coord[2]
execute store result score rx map run data get entity @s Rotation[0]



scoreboard players add rx map 180
scoreboard players operation rx map %= #360 calc.DSC
scoreboard players remove rx map 180