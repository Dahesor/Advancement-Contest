execute store result storage dlm: result_pos.x int 16 run data get storage dlm: gc[0].cx
execute store result storage dlm: result_pos.z int 16 run data get storage dlm: gc[0].cz
function dlm:zzz/gc/__remove_forceload with storage dlm: result_pos

data remove storage dlm: gc[0]
execute if data storage dlm: gc[0] run function dlm:zzz/gc/each_chunk