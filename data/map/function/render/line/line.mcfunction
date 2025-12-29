data modify storage map:main line set from storage map:main temp[0]
execute if score on main matches 1 run function map:render/line/border/render
execute unless data storage map:main temp[0][].update run return run function map:render/line/next_line


scoreboard players set __char_count map 0

scoreboard players set _char_1 map 1
scoreboard players set _char_2 map 1
data modify storage map:main last_color set value {a:"#123456",b:"#123456",key:0}

data modify storage map:main text[0] set from storage map:main text_template[0]
data modify storage map:main text[1] set from storage map:main text_template[1]

data modify storage map:main text[0] append from storage map:main text[0][0]
data remove storage map:main text[0][0]
data modify storage map:main text[1] append from storage map:main text[1][0]
data remove storage map:main text[1][0]
function map:render/line/char
data modify storage map:main text[0] append from storage map:main text[0][0]
data remove storage map:main text[0][0]
data modify storage map:main text[1] append from storage map:main text[1][0]
data remove storage map:main text[1][0]

function map:render/line/next_line