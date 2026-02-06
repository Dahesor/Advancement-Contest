execute if score __last_y map matches -1000 run return run scoreboard players set $__height map 0
scoreboard players set __new_y map 84
scoreboard players operation __new_y map -= __left map
scoreboard players operation $__height map = __last_y map
scoreboard players operation $__height map -= __new_y map