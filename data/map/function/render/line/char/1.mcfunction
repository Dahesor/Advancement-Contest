execute store result score #color_changed map run data modify storage map:main last_color.a set from storage map:main line[0].color[0]
data remove storage map:main line[0].color[0]

#Same Color
execute unless score #color_changed map matches 1 run return run function map:render/line/char/1_same_color

#Different Color
scoreboard players set _char_1 map 1
data modify storage map:main text[0][0] set value {translate:"1",color:"white"}
data modify storage map:main text[0][0].color set from storage map:main last_color.a

data modify storage map:main text[0] append from storage map:main text[0][0]
data remove storage map:main text[0][0]