function map:render/switch/save_text

execute unless score now_drawing map matches 1.. run data modify storage map:main render.overworld set from storage map:main text_ready
execute if score now_drawing map matches 1 run data modify storage map:main render.the_nether set from storage map:main text_ready
execute if score now_drawing map matches 2 run data modify storage map:main render.the_end set from storage map:main text_ready

scoreboard players add now_drawing map 1
execute if score now_drawing map matches 3.. run scoreboard players set now_drawing map 0

function map:render/switch/refresh_decs