execute unless function dlm:zzz/input/get_dimension run return fail

data modify storage dlm: namespace set value "minecraft:"

execute store result score #length dlm__ run data get storage dlm: n_t.dimension
execute if score #length dlm__ matches 11.. store success score #success dlm__ run data modify storage dlm: namespace set string storage dlm: n_t.dimension 0 10
execute if score #length dlm__ matches 11.. if score #success dlm__ matches 0 run return 1

data modify storage dlm: string set from storage dlm: n_t.dimension
execute unless function dlm:zzz/input/read_chars run function dlm:zzz/input/add_default_ns with storage dlm: n_t
return 1