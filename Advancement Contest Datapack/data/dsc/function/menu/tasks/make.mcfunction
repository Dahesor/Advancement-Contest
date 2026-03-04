execute unless score on main matches 1.. unless entity @s[scores={team=1..}] run return fail
function dsc:player/uid/get

data modify storage temp dialog.dialog set value {type:"notice",title:"任务列表",\
    can_close_with_escape:true,pause:false,after_action:none,\
    body:[\
        {type:"plain_message",contents:[""],width:400},\
    ],\
    action:{label:{translate:"gui.done"},action:{type:"run_command",command:"/trigger dialog set -999"}}\
}

data modify storage main: p_tracks set from storage main: player[0].task.result
scoreboard players set #e calc.DSC 99
data modify storage run b set value {1:0,2:0,3:0,4:0}
function dsc:menu/tasks/make/entries

scoreboard players set @s screen 2
scoreboard players operation @s task_client_session = @s task_build_ver
function dsc:menu/any with storage temp dialog
