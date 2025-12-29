scoreboard players set #test calc.DSC 0
scoreboard players set $__height map 0
tp @s ~ ~ ~
execute store result score __new_y map run data get entity @s Pos[1]
execute if score __last_y map matches -1000 run return fail
scoreboard players operation $__height map = __last_y map
scoreboard players operation $__height map -= __new_y map