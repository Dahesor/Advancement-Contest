execute unless score on main matches 1.. unless entity @s[scores={team=1..}] run return fail
function dsc:player/uid/get

data modify storage temp dialog.dialog set value {type:"notice",title:"任务列表",\
    can_close_with_escape:true,pause:false,after_action:none,\
    body:[\
        {type:"plain_message",contents:[{text:"§f置顶显示描述：§r§n关",hover_event:{action:"show_text",value:"开启时，总是可见的置顶栏\n也会显示进度描述"},click_event:{action:"run_command",command:"/trigger dialog set 21"},color:"yellow"}],width:400},\
        {type:"plain_message",contents:[""],width:400},\
    ],\
    action:{label:{translate:"gui.done"},action:{type:"run_command",command:"/trigger dialog set -999"}}\
}

execute unless entity @s[tag=hide_task_lore] run data modify storage temp dialog.dialog.body[0].contents[0] merge value {text:"§f置顶显示描述：§r§n开",color:"gold"}

execute if entity @s[tag=hide_task_lore] run tag @s add __hide_task_lore
tag @s remove hide_task_lore
scoreboard players set #always_long calc.DSC 1

data modify storage main: p_tracks set from storage main: player[0].task.result
scoreboard players set #e calc.DSC 99
data modify storage run b set value {1:0,2:0,3:0,4:0}
function dsc:menu/tasks/make/entries

execute if entity @s[tag=__hide_task_lore] run tag @s add hide_task_lore
tag @s remove __hide_task_lore
scoreboard players set #always_long calc.DSC 0

scoreboard players set @s screen 2
scoreboard players operation @s task_client_session = @s task_build_ver
function dsc:menu/any with storage temp dialog
