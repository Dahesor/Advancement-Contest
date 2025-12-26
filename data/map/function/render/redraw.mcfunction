data modify storage map:main text_ready set from storage map:main text

scoreboard players set __line_count map 0
data modify storage map:main text append from storage map:main text[0]
data remove storage map:main text[0]

data modify storage map:main text_ready append value [{text:"",font:"dsc:map_3"},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},{text:" "},"\n"]
function map:render/dec/parse
function map:render/player/get_all
