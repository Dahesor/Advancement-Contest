execute unless score centered main matches 1 run return fail
scoreboard players operation $map_frame calc.DSC = MAP_UPDATE_SPEED calc.DSC
execute if entity @a[tag=dsc.mapping,scores={md.dimension=1}] run function map:page/dialog
execute if entity @a[tag=dsc.mapping,scores={md.dimension=2}] run function map:page/dialog_nether
execute if entity @a[tag=dsc.mapping,scores={md.dimension=3}] run function map:page/dialog_end

tag @a remove dsc.__mapping_request
tag @a[tag=map.static] remove dsc.mapping

