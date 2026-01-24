execute unless data storage dlm: new.pos unless data storage dlm: new.id run return -1

#Validate Position and To
execute unless function dlm:z_private/new/pos run return -2
scoreboard players set #has_var.to dlm.int 0
execute if data storage dlm: new.to unless function dlm:z_private/new/to run return -3

#Check Dimension
scoreboard players set #has_var.Dimension dlm.int 1
execute unless data storage dlm: new.dimension run function dlm:z_private/new/dimension