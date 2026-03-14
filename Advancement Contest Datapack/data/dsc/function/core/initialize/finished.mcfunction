
execute in gen:lobby run tp @a 0 72 0

dialog show @a {type:"notice",title:"我们准备好了",body:[{type:"plain_message",contents:{text:"可以邀请玩家加入你的服务器了",color:"green"}},{type:"plain_message",contents:"分队结束后，再次打开管理员面板以开始游戏"}],pause:false}
setworldspawn ~ 313 ~
execute as @a run attribute @s block_interaction_range modifier remove gen:block
scoreboard players set prepared main 1
function registry:register
schedule function dsc:core/initialize/waiting_tick 1s