execute if predicate {condition:"location_check",predicate:{dimension:"minecraft:overworld"}} run return run data modify storage dlm: new.dimension set value "minecraft:overworld"
execute if predicate {condition:"location_check",predicate:{dimension:"minecraft:the_nether"}} run return run data modify storage dlm: new.dimension set value "minecraft:the_nether"
execute if predicate {condition:"location_check",predicate:{dimension:"minecraft:the_end"}} run return run data modify storage dlm: new.dimension set value "minecraft:the_end"
scoreboard players set #has_var.Dimension dlm.int 0