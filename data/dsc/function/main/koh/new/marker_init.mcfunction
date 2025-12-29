fill ~-1 ~ ~-1 ~1 ~4 ~1 barrier
fill ~ ~ ~ ~ 319 ~ barrier
setblock ~ ~1 ~ beacon
tag @s remove __koh.loading

summon armor_stand ~ ~ ~ {Tags:["__koh.loading"],Small:1b,Invisible:1b,Marker:1b}
ride @s mount @n[type=armor_stand,distance=..3,tag=__koh.loading]
execute on vehicle run function dsc:main/koh/new/armor_st_init

data modify storage map:main dec_koh set value {x:0,z:0,char:"E",id:-99999}
execute store result storage map:main dec_koh.x int 1 run data get entity @s Pos[0]
execute store result storage map:main dec_koh.z int 1 run data get entity @s Pos[2]