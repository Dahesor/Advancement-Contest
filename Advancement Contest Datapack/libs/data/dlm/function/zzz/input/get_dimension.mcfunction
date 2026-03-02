execute if data storage dlm: ticket.dimension run return run data modify storage dlm: n_t.dimension set from storage dlm: ticket.dimension

execute if dimension overworld run return run data modify storage dlm: n_t.dimension set value "minecraft:overworld"
execute if dimension the_nether run return run data modify storage dlm: n_t.dimension set value "minecraft:the_nether"
execute if dimension the_end run return run data modify storage dlm: n_t.dimension set value "minecraft:the_end"

execute positioned ~ 5000 ~ summon piglin_brute run function dlm:zzz/input/read_dimension

scoreboard players set ERROR_CODE dlm__ 10
return fail