data modify storage map:main text[0][0] set value " "
data modify storage map:main text[0][1] set value " "
data modify storage map:main text[1][0] set value " "
data modify storage map:main text[1][1] set value " "
scoreboard players set _char_1 map 1
scoreboard players set _char_2 map 1
data modify storage map:main last_color set value {a:"#123456",b:"#123456",key:0}
function map:render/line/next_char