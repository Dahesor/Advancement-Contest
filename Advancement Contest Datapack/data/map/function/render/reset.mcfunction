data modify storage map:main text_ready set from storage map:main text
data modify storage map:main render set value {}
data modify storage map:main render.overworld set from storage map:main text_ready
data modify storage map:main render.the_nether set from storage map:main text_ready
data modify storage map:main render.the_end set from storage map:main text_ready

scoreboard players set __line_count map 0
data modify storage map:main text append from storage map:main text[0]
data remove storage map:main text[0]
data modify storage map:main text_template append from storage map:main text_template[0]
data remove storage map:main text_template[0]

data modify storage map:main text_ready append value [{text:"",font:"dsc:map_3"},{text:"^"},"\n"]