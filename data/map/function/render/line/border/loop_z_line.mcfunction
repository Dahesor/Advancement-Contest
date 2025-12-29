execute if score cell map >= Border_x_min main if score cell map <= Border_x_max main run function map:render/line/border/z_pixel
scoreboard players add cell map 1
data modify storage map:main line append from storage map:main line[0]
data remove storage map:main line[0]
execute if score cell map matches ..63 run function map:render/line/border/loop_z_line