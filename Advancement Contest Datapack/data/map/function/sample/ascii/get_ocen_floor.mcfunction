tp @s ~ ~ ~
execute store result score __ocean_floor map run data get entity @s Pos[1]
scoreboard players operation $__height map = __new_y map
scoreboard players operation $__height map -= __ocean_floor map