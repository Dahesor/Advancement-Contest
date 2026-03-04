execute store result score #this_id calc.DSC run data get storage team: outpost.this[0].id
execute if score @s died.revive_target = #this_id calc.DSC run return run function dsc:main/player/death/menu/word/selected

execute if score #state calc.DSC matches 1 run return run data modify storage temp dialog.body[-1].description.contents.with[3] merge value {text:"点击选择（敌人靠近）",color:"yellow"}
execute if score #state calc.DSC matches 2 run return run data modify storage temp dialog.body[-1].description.contents.with[3] merge value {text:"点击选择（被敌人发现）",color:"gold"}
execute if score #state calc.DSC matches 3 run return run data modify storage temp dialog.body[-1].description.contents.with[3] merge value {text:"无法使用（敌人过近）",color:"red",underlined:false}