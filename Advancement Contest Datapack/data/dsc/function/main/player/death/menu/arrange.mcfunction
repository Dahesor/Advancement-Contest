tag @s add respawn_menu
scoreboard players operation $this team = @s team
function dsc:core/relate/score__team
function dsc:main/player/death/menu/next/cache

scoreboard players set @s screen 1

data modify storage temp dialog.dialog set value {type:"confirmation",no:{label:{translate:"gui.done"},action:{type:"run_command",command:"/trigger input set -2"}},yes:{label:{text:"刷新"},action:{type:"run_command",command:"/trigger input set -1"}},pause:false,after_action:"none",title:"选择复活位置……",can_close_with_escape:true,body:[\
        {type:"item",item:{id:"barrier"},description:"没有可用的复活点。等待存活的队友……"},\
    ]\
}


data modify storage run num set value {i:0}
execute if score @s died.revive_target matches -1 run data modify storage temp dialog.body set value [{type:"plain_message",contents:{text:"暂时观望中（不复活）",color:"red",bold:true}}]
execute unless score @s died.revive_target matches -1 run data modify storage temp dialog.body set value [{type:"plain_message",contents:{text:"点击以暂时观望（不复活）",color:"yellow",underlined:true,click_event:{action:"run_command",command:"/trigger input set -999"}}}]

data modify storage temp i set value 0
execute if data storage team: outpost.this[0] run function dsc:main/player/death/menu/each

execute if data storage temp dialog.body[1] run data modify storage temp dialog.dialog.body set from storage temp dialog.body

function dsc:menu/any with storage temp dialog