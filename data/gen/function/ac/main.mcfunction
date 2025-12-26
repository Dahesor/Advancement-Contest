tp @a ~ -32 ~
execute if score $exe gen matches 1 run return run function gen:ac/fill_block
execute if score $exe gen matches 2 run return run function gen:ac/reform/tick

tellraw @a [{text:"\n[gen:ac] 远古城市操作完成",color:"gray"}]
forceload remove ~-120 ~-120 ~120 ~120
scoreboard players set next gen 0
schedule clear gen:ac/ticker