execute in the_nether store result score nether_border_size main run worldborder get
scoreboard players operation nether_radius main = nether_border_size main
scoreboard players operation nether_radius main /= #2 calc.DSC
scoreboard players operation Chunk_nether_radius main = nether_radius main
scoreboard players operation Chunk_nether_radius main /= #16 calc.DSC
scoreboard players operation current_x_min_nether main = #center_x.nether main
scoreboard players operation current_x_max_nether main = #center_x.nether main
scoreboard players operation current_z_min_nether main = #center_z.nether main
scoreboard players operation current_z_max_nether main = #center_z.nether main
scoreboard players operation current_x_min_nether main -= nether_radius main
scoreboard players operation current_x_max_nether main += nether_radius main
scoreboard players operation current_z_min_nether main -= nether_radius main
scoreboard players operation current_z_max_nether main += nether_radius main

scoreboard players set Border_x_min.nether main 32
scoreboard players set Border_x_max.nether main 32
scoreboard players set Border_z_min.nether main 32
scoreboard players set Border_z_max.nether main 32
scoreboard players operation Border_x_min.nether main -= Chunk_nether_radius main
scoreboard players operation Border_x_max.nether main += Chunk_nether_radius main
scoreboard players operation Border_z_min.nether main -= Chunk_nether_radius main
scoreboard players operation Border_z_max.nether main += Chunk_nether_radius main

execute in overworld store result score main_border_size main run worldborder get
scoreboard players operation main_radius main = main_border_size main
scoreboard players operation main_radius main /= #2 calc.DSC
scoreboard players operation Chunk_main_radius main = main_radius main
scoreboard players operation Chunk_main_radius main /= #16 calc.DSC
scoreboard players operation current_x_min main = #center_x main
scoreboard players operation current_x_max main = #center_x main
scoreboard players operation current_z_min main = #center_z main
scoreboard players operation current_z_max main = #center_z main
scoreboard players operation current_x_min main -= main_radius main
scoreboard players operation current_x_max main += main_radius main
scoreboard players operation current_z_min main -= main_radius main
scoreboard players operation current_z_max main += main_radius main

scoreboard players set Border_x_min main 32
scoreboard players set Border_x_max main 32
scoreboard players set Border_z_min main 32
scoreboard players set Border_z_max main 32
scoreboard players operation Border_x_min main -= Chunk_main_radius main
scoreboard players operation Border_x_max main += Chunk_main_radius main
scoreboard players operation Border_z_min main -= Chunk_main_radius main
scoreboard players operation Border_z_max main += Chunk_main_radius main

return 1
scoreboard players operation Chunk_x_min main = current_x_min main
scoreboard players operation Chunk_x_min main /= #16 calc.DSC
scoreboard players operation Chunk_x_max main = current_x_max main
scoreboard players operation Chunk_x_max main /= #16 calc.DSC

scoreboard players operation Chunk_z_min main = current_z_min main
scoreboard players operation Chunk_z_min main /= #16 calc.DSC
scoreboard players operation Chunk_z_max main = current_z_max main
scoreboard players operation Chunk_z_max main /= #16 calc.DSC
