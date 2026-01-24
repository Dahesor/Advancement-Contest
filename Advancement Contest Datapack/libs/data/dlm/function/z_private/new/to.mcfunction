data modify storage dlm: proc.pos set from storage dlm: new.to
execute unless function dlm:z_private/new/coord_normalize run return fail
scoreboard players set #has_var.to dlm.int 1
execute if data storage dlm: new.to[0] run data modify storage dlm: new.to set from storage dlm: proc.npos
return 1