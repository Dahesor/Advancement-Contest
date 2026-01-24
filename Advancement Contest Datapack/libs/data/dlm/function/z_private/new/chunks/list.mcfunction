data modify storage dlm: proc.chunks set value []
execute store result score #x dlm.int run data get storage dlm: new.pos.x
execute store result score #z dlm.int run data get storage dlm: new.pos.z

execute unless score #has_var.to dlm.int matches 1 run return run function dlm:z_private/new/chunks/single


