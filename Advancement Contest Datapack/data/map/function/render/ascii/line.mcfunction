data modify storage map:main line set from storage map:main temp[0]

execute if score on main matches 1 if score now_drawing map matches 0 run function map:render/line/border/render
execute if score on main matches 1 if score now_drawing map matches 1 run function map:render/line/border_nether/render
#execute unless data storage map:main temp[0][].update run return run function map:render/ascii/next_line

scoreboard players set __char_count map 0

scoreboard players set _char_1 map 1
scoreboard players set _char_2 map 1

data modify storage map:main chars set value []
data modify storage map:main chars append from storage map:main line[].ascii[]

function map:render/ascii/concat/start

data modify storage map:main text[0] set value [["",""]]
data modify storage map:main text[1] set value [["",""]]

data modify storage map:main text[0] prepend from storage map:main text_template[0][0]
data modify storage map:main text[0] append from storage map:main text_template[0][-1]
data modify storage map:main text[1] prepend from storage map:main text_template[1][0]
data modify storage map:main text[1] append from storage map:main text_template[1][-1]

#We just have to change text[0,1][1] now
data modify storage map:main text[0][1][0] set from storage map:main fchars[0]
data modify storage map:main text[0][1][1] set from storage map:main fchars[1]
data modify storage map:main text[1][1][0] set from storage map:main fchars[2]
data modify storage map:main text[1][1][1] set from storage map:main fchars[3]

function map:render/line/next_line