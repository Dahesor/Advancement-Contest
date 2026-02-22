scoreboard players remove #blocking calc.DSC 1
execute at 0-0-0-0-9 positioned ~4 300 ~4 as @e[type=item,distance=..6] if items entity @s contents filled_map run return run function dsc:main/init/map/result
execute if score #blocking calc.DSC matches ..0 run return run tellraw @a [{text:"[ERR] ",color:"red"},"Map Lost"]
schedule function dsc:main/init/map/find_result 1t