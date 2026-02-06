execute if score nether_border_size main matches 1020.. run return fail

execute if score __line_count map < Border_z_min.nether main run return fail
execute if score __line_count map > Border_z_max.nether main run return fail

data modify storage map:main temp[0][0].update set value true
scoreboard players set need_update map 1

execute if score __line_count map = Border_z_min.nether main run return run function map:render/line/border_nether/z_line
execute if score __line_count map = Border_z_max.nether main run return run function map:render/line/border_nether/z_line

data modify storage run num set value {i:0}
execute store result storage run num.i int 1 run scoreboard players get Border_x_min.nether main
execute if score stage main matches 3.. run function map:render/line/border_nether/__x_line with storage run num
execute unless score stage main matches 3.. run function map:render/line/border_nether/__x_line_1 with storage run num
execute store result storage run num.i int 1 run scoreboard players get Border_x_max.nether main
execute if score stage main matches 3.. run function map:render/line/border_nether/__x_line with storage run num
execute unless score stage main matches 3.. run function map:render/line/border_nether/__x_line_1 with storage run num