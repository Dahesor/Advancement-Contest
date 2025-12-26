scoreboard players enable @a dialog
execute as @a at @s run function dsc:player/tick

function map:scanner/locater
function map:render/draw
#function map:render/draw
tp 0-0-0-0-0 512 0 512

scoreboard players remove $map_frame calc.DSC 1
execute if entity @a[tag=dsc.__mapping_request] run function map:page/dialog
execute if score $map_frame calc.DSC matches ..0 if entity @a[tag=dsc.mapping] run function map:page/dialog