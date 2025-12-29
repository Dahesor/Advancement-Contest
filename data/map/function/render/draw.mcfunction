execute unless score __line_count map matches 0..63 run function map:render/redraw

data modify storage run index set value {x:0}
execute store result storage run index.x int 1 run scoreboard players get __line_count map

data modify storage map:main temp set value []
function map:render/__get_data with storage run index

scoreboard players set need_update map 0
function map:render/line/line

scoreboard players add __line_count map 1

execute unless score need_update map matches 1 run function map:render/__remove_update with storage run index
execute if score need_update map matches 1 run function map:render/__need_update with storage run index
