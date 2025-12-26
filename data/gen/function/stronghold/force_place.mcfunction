place template gen:portal_room ~ 10 ~

data modify storage map:main dec append value {char:"h",x:0,z:0}
execute store result storage map:main dec[-1].x int 1 run scoreboard players get zero_x gen
execute store result storage map:main dec[-1].z int 1 run scoreboard players get zero_z gen