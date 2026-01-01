execute unless score centered main matches 1 run return run function dsc:menu/admin/center

execute if score on main matches 1 run return run dialog show @s {type:"notice",title:"游戏进行中",body:{type:"plain_message",contents:"游戏进行中"}}

dialog show @s {type:"confirmation",title:"开始游戏",body:[{type:"plain_message",contents:{text:"开始游戏？",color:"red"}}],after_action:"close",no:{label:"取消"},yes:{label:"确定",action:{type:"run_command",command:"/function dsc:main/init/port"}}}