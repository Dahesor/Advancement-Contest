data modify storage dlm: this_ticket set value {}
data modify storage dlm: this_ticket.id set from storage dlm: n_t.id
data modify storage dlm: this_ticket.life set from storage dlm: n_t.life
data modify storage dlm: this_ticket.until set value -1
execute if data storage dlm: n_t.life{type:"wait"} run function dlm:zzz/new/get_kill_time

execute if data storage dlm: n_t.life{type:"wait"} run function dlm:zzz/new/insert_timed
execute unless data storage dlm: n_t.life{type:"wait"} run data modify storage dlm: live_tickets append from storage dlm: this_ticket
function dlm:zzz/new/get_corners

scoreboard players operation $this_x dlm__ = x dlm__
scoreboard players operation $this_z dlm__ = z dlm__
scoreboard players operation #this_cx dlm__ = cx dlm__
scoreboard players operation #this_cz dlm__ = cz dlm__


scoreboard players set #has_load dlm__ 0
execute if data storage dlm: n_t.on_load run function dlm:zzz/new/init_load_check

data modify storage dlm: result_pos set value {x:0,z:0,dimension:"overworld"}
data modify storage dlm: result_pos.dimension set from storage dlm: n_t.dimension

data modify storage dlm: vld.fload set value {x:0,z:0,dimension:"overworld",dx:0,dz:0}
data modify storage dlm: vld.fload.dimension set from storage dlm: n_t.dimension

data modify storage dlm: vld.cc set value {cx:0,cz:0}

#Forceload the chunks
execute store result storage dlm: vld.fload.x int 1 run scoreboard players get x dlm__
execute store result storage dlm: vld.fload.z int 1 run scoreboard players get z dlm__
execute store result storage dlm: vld.fload.dx int 1 run scoreboard players get dx dlm__
execute store result storage dlm: vld.fload.dz int 1 run scoreboard players get dz dlm__
function dlm:zzz/new/__forceload with storage dlm: vld.fload

function dlm:zzz/locate/__dimension with storage dlm: n_t
function dlm:zzz/new/each_chunk