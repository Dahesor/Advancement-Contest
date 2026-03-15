data modify storage main: p_tracks set from storage main: player[0].task.result
execute store result score #total calc.DSC run data get storage main: p_tracks
scoreboard players operation #total_lines calc.DSC = #total calc.DSC
scoreboard players remove #total_lines calc.DSC 1
scoreboard players operation #total_lines calc.DSC /= #4 calc.DSC
scoreboard players add #total_lines calc.DSC 1
scoreboard players set #skip calc.DSC 0
scoreboard players set #e calc.DSC 99
execute if data storage main: player[0].task.looking_at store result score #skip calc.DSC run data get storage main: player[0].task.looking_at
execute if score #skip calc.DSC >= #total_lines calc.DSC run data modify storage main: player[0].task.looking_at set value 0
execute if score #skip calc.DSC >= #total_lines calc.DSC run scoreboard players set #skip calc.DSC 0
scoreboard players operation #temp calc.DSC = #skip calc.DSC
scoreboard players operation #temp calc.DSC /= TASKLINE_PER_PAGE calc.DSC
scoreboard players add #temp calc.DSC 1
scoreboard players operation #total calc.DSC = #total_lines calc.DSC
scoreboard players remove #total calc.DSC 1
scoreboard players operation #total calc.DSC /= TASKLINE_PER_PAGE calc.DSC
scoreboard players add #total calc.DSC 1
data modify storage run b set value {1:0,2:0,3:0,4:0}
execute store result storage run b.1 int 1 run scoreboard players get #temp calc.DSC
execute store result storage run b.2 int 1 run scoreboard players get #total calc.DSC

data modify storage temp dialog.dialog set value {type:"notice",title:{translate:"ptt",with:["",""]},\
    can_close_with_escape:true,pause:false,after_action:none,\
    body:[\
        {type:"plain_message",contents:["",{text:"<",font:"dsc:button",hover_event:{action:"show_text",value:"上一页"},click_event:{action:"run_command",command:"/trigger dialog set 22"},shadow_color:0},"    ",{text:"§f置顶显示描述：§r§n关",hover_event:{action:"show_text",value:"开启时，总是可见的置顶栏\n也会显示进度描述"},click_event:{action:"run_command",command:"/trigger dialog set 21"},color:"yellow"},"    ",{text:">",font:"dsc:button",hover_event:{action:"show_text",value:"下一页"},click_event:{action:"run_command",command:"/trigger dialog set 23"},shadow_color:0}],width:400},\
        {type:"plain_message",contents:[""],width:400},\
    ],\
    action:{label:{translate:"gui.done"},action:{type:"run_command",command:"/trigger dialog set -999"}}\
}
execute unless entity @s[tag=hide_task_lore] run data modify storage temp dialog.dialog.body[0].contents[3] merge value {text:"§f置顶显示描述：§r§n开",color:"gold"}
data modify storage temp dialog.dialog.title.with[0] set string storage run b.1
data modify storage temp dialog.dialog.title.with[1] set string storage run b.2
execute if score #skip calc.DSC matches 0 run data modify storage temp dialog.dialog.body[0].contents[1] set value {text:"[",hover_event:{action:"show_text",value:{text:"已在第一页",color:"gray"}},shadow_color:0,font:"dsc:button"}


#tag
    execute if entity @s[tag=hide_task_lore] run tag @s add __hide_task_lore
    tag @s remove hide_task_lore
    scoreboard players set #always_long calc.DSC 1
#tag



function dsc:menu/tasks/make/entries

#tag
    execute if entity @s[tag=__hide_task_lore] run tag @s add hide_task_lore
    tag @s remove __hide_task_lore
    scoreboard players set #always_long calc.DSC 0
#tag

data modify storage main: player[0].task.build set from storage temp dialog.dialog