data modify storage dlm: ticket set value {id:"gen:ac",life:{type:"indefinite"},on_load:"schedule function gen:ac/ticker 1t replace"}

$execute positioned $(x) -51 $(z) positioned ~-120 ~ ~-120 summon marker run function gen:ac/reform/forceload_ticket

function dlm:new_ticket