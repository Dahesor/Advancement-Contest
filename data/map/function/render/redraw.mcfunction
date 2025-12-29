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

data modify storage map:main dec_temp set value []
execute if data storage map:main dec_koh.id run data modify storage map:main dec_temp append from storage map:main dec_koh
scoreboard players set __dec_in map 1
execute if data storage map:main dec_temp[0].char run function map:render/dec/element