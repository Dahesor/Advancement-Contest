data modify storage dlm: result_pos set value {x:0,z:0}
execute store result storage dlm: result_pos.x int 1 run data get storage dlm: pos.x
execute store result storage dlm: result_pos.z int 1 run data get storage dlm: pos.z


return 1