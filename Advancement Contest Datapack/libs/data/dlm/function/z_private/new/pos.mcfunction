data modify storage dlm: proc.pos set from storage dlm: new.pos
execute unless function dlm:z_private/new/coord_normalize run return fail
execute if data storage dlm: new.pos[0] run data modify storage dlm: new.pos set from storage dlm: proc.npos
return 1