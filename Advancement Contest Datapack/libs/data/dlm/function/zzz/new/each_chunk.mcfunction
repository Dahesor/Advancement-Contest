execute store result storage dlm: vld.cc.cx int 1 run scoreboard players get #this_cx dlm__
execute store result storage dlm: vld.cc.cz int 1 run scoreboard players get #this_cz dlm__

function dlm:zzz/locate/__chunk with storage dlm: vld.cc
data modify storage dlm: data[0].Chunks[0].tickets append value {valid:true}
data modify storage dlm: data[0].Chunks[0].tickets[-1].id set from storage dlm: n_t.id

execute if score #has_load dlm__ matches 1 run function dlm:zzz/new/add_cmd_check

#Next Chunk
scoreboard players add #this_cx dlm__ 1
execute if score #this_cx dlm__ > dcx dlm__ run scoreboard players add #this_cz dlm__ 1
execute if score #this_cx dlm__ > dcx dlm__ run scoreboard players operation #this_cx dlm__ = cx dlm__
execute unless score #this_cz dlm__ > dcz dlm__ run function dlm:zzz/new/each_chunk