scoreboard players add _char_1 map 1
execute store result storage map:main last_color.key int 1 run scoreboard players get _char_1 map
data modify storage map:main text[0][-1].translate set string storage map:main last_color.key
data remove storage map:main text[0][0]