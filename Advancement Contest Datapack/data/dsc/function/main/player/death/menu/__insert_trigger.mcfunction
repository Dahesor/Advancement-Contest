data modify storage temp dialog.body[-1].description.contents set value {translate:"op.select",with:[{text:"",color:"light_purple"},{translate:"comp.vec3",with:["","",""],color:"gray"},{translate:"comp.next_wave",with:[""],color:"aqua"},{text:"点击选择（安全）",underlined:true,color:"green"}]}

data modify storage temp dialog.body[-1].description.contents.with[0].text set string storage team: outpost.this[0].count
data modify storage temp dialog.body[-1].description.contents.with[1].with[0] set string storage team: outpost.this[0].x
data modify storage temp dialog.body[-1].description.contents.with[1].with[1] set string storage team: outpost.this[0].y
data modify storage temp dialog.body[-1].description.contents.with[1].with[2] set string storage team: outpost.this[0].z
execute store result score #next_wave calc.DSC run data get storage team: outpost.this[0].next_spawn
scoreboard players operation #next_wave calc.DSC -= $gametime calc.DSC
scoreboard players operation #next_wave calc.DSC /= #20 calc.DSC
execute store result storage temp i int 1 run scoreboard players add #next_wave calc.DSC 1

data modify storage temp dialog.body[-1].description.contents.with[2].with[0] set string storage temp i

execute store result score #state calc.DSC run data get storage team: outpost.this[0].state
function dsc:main/player/death/menu/word/cases

execute if score @s died.revive_target = #this_id calc.DSC run data modify storage temp dialog.body[-1].description.contents.with[2] merge value {color:"light_purple",underlined:true,bold:true}

$execute unless score @s died.revive_target = #this_id calc.DSC if score #state calc.DSC matches ..2 run data modify storage temp dialog.body[-1].description.contents.with[3].click_event set value {action:"run_command",command:"/trigger input set $(id)"}