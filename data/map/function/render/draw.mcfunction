execute unless score __line_count map matches 0..63 run function map:render/redraw

data modify storage run index set value {x:0}
execute store result storage run index.x int 1 run scoreboard players get __line_count map

data modify storage map:main temp set value []
function map:render/__get_data with storage run index

function map:render/line/line

scoreboard players add __line_count map 1

function map:render/__remove_update with storage run index
