data modify storage map:main text_ready set from storage map:main text
data modify storage map:main nether.final set from storage map:main nether.raw
data modify storage map:main the_end.final set from storage map:main the_end.raw

scoreboard players set __line_count map 0
data modify storage map:main text append from storage map:main text[0]
data remove storage map:main text[0]
data modify storage map:main text_template append from storage map:main text_template[0]
data remove storage map:main text_template[0]

#data modify storage map:main text_ready set from storage map:main nether.raw

data modify storage map:main text_ready append value [{text:"",font:"dsc:map_3"},{text:"^"},"\n"]
data modify storage map:main nether.final append value [{text:"",font:"dsc:map_3"},{text:"^"},"\n"]
data modify storage map:main the_end.final append value [{text:"",font:"dsc:map_3"},{text:"^"},"\n"]
function map:render/dec/parse

function map:render/player/get_all
