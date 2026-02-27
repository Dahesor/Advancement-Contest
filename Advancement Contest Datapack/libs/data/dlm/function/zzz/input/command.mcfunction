execute if data storage dlm: ticket.on_load[0] run return run data modify storage dlm: n_t.on_load set from storage dlm: ticket.on_load

data modify storage dlm: n_t.on_load set value []
data modify storage dlm: n_t.on_load append from storage dlm: ticket.on_load