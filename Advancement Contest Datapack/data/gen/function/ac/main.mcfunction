tp @a ~ 500 ~
execute if score $exe gen matches 1 run return run function gen:ac/fill_block
execute if score $exe gen matches 2 run return run function gen:ac/reform/tick

data modify storage gen gen_log prepend value [{text:"\n[gen:ac] 远古城市操作完成\n",color:"white"}]
function dlm:close_ticket {id:"gen:ac"}
scoreboard players set next gen 0
schedule clear gen:ac/ticker