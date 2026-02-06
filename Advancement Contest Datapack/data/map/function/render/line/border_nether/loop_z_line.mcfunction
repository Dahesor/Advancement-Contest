execute if score cell map >= Border_x_min.nether main if score cell map <= Border_x_max.nether main run function map:render/line/border_nether/z_pixel
scoreboard players add cell map 1
data modify storage map:main line append from storage map:main line[0]
data remove storage map:main line[0]
execute if score cell map matches ..63 run function map:render/line/border_nether/loop_z_line