data modify storage temp text set value {translate:"e.op",with:[{text:"-1",shadow_color:-16579829,color:"aqua"}]}

data modify storage temp text.with[-1].text set string storage team: outpost.this[0].count

execute store result score #state calc.DSC run data get storage team: outpost.this[0].state

execute if score #state calc.DSC matches 0 run data modify storage temp text.with prepend from storage temp text_storage.s[]
execute if score #state calc.DSC matches 1 run data modify storage temp text.with prepend from storage temp text_storage.w[]
execute if score #state calc.DSC matches 2 run data modify storage temp text.with prepend from storage temp text_storage.d[]
execute if score #state calc.DSC matches 3 run data modify storage temp text.with prepend from storage temp text_storage.l[]

data modify storage sidebar.dah:data ui.lore append from storage temp text
data remove storage team: outpost.this[0]
execute if data storage team: outpost.this[0] run function dsc:module/sidebar/this/outpost