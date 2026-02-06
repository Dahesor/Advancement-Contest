scoreboard players set __new_y map 40
scoreboard players set __left map 55
execute positioned ~ 84 ~ run function map:sample/height/find_air
execute if score __left map matches ..0 positioned ~ 127 ~ run data modify storage map:main ascii set value "É"