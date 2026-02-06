scoreboard players set __new_y map 31
scoreboard players set __left map 55
execute positioned ~ 84 ~ run function map:sample/height/find_air

#Nothing Found. Set Lava

execute if score __left map matches ..0 run data modify storage map:main ascii set value "É"