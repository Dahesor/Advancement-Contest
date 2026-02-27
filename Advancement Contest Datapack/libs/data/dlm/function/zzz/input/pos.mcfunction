scoreboard players set ERROR_CODE dlm__ 2

data modify storage dlm: result_pos set value {x:0,z:0}
execute if data storage dlm: pos.x if data storage dlm: pos.z run return run function dlm:zzz/input/pos_list

execute unless data storage dlm: pos[1] run return fail

execute store result storage dlm: result_pos.x int 1 run data get storage dlm: pos[0]
execute unless data storage dlm: pos[2] store result storage dlm: result_pos.z int 1 run data get storage dlm: pos[1]
execute if data storage dlm: pos[2] store result storage dlm: result_pos.z int 1 run data get storage dlm: pos[2]

return 1