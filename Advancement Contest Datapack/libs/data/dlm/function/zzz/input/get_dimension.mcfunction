execute if data storage dlm: ticket.dimension run return run data modify storage dlm: n_t.dimension set from storage dlm: ticket.dimension
function #dlm:custom_dimensions
execute if data storage dlm: ticket.dimension run return run data modify storage dlm: n_t.dimension set from storage dlm: ticket.dimension

execute if dimension overworld run return run data modify storage dlm: n_t.dimension set value "minecraft:overworld"
execute if dimension the_nether run return run data modify storage dlm: n_t.dimension set value "minecraft:the_nether"
execute if dimension the_end run return run data modify storage dlm: n_t.dimension set value "minecraft:the_end"

scoreboard players set ERROR_CODE dlm__ 10
return fail