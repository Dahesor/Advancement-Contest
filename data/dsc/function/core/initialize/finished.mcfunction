execute positioned ~-20 ~1 ~-20 run place template gen:lobby
forceload remove ~-20 ~-20 ~20 ~20
forceload add ~ ~
tp @a ~0.5 308 ~0.5
dialog show @a {type:"notice",title:"我们准备好了",body:[{type:"plain_message",contents:{text:"可以邀请玩家加入你的服务器了",color:"green"}},{type:"plain_message",contents:"分队结束后，再次打开管理员面板以开始游戏"}],pause:false}
setworldspawn ~ 313 ~
execute as @a run attribute @s block_interaction_range modifier remove gen:block

function registry:register