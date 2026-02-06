data modify storage map:main text_ready set from storage map:main text
data modify storage map:main text_ready append value [{text:"",font:"dsc:map_3"},{text:"^"},"\n"]

scoreboard players set __line_count map 0
data modify storage map:main text append from storage map:main text[0]
data remove storage map:main text[0]
data modify storage map:main text_template append from storage map:main text_template[0]
data remove storage map:main text_template[0]