execute if data storage dlm: proc.pos.x if data storage dlm: proc.pos.z run return 1
execute unless data storage dlm: proc.pos[1] run return fail

data modify storage dlm: proc.npos set value {}
data modify storage dlm: proc.npos.x set from storage dlm: proc.pos[0]

execute if data storage dlm: proc.pos[2] run data remove storage dlm: proc.pos[1]
data modify storage dlm: proc.npos.z set from storage dlm: proc.pos[1]
return 1