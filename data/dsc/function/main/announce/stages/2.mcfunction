title @a times 10 50 10
title @a title ""
title @a subtitle "阶段二：山丘之王"
tellraw @a [{text:"",color:"yellow"},{translate:"head.game",color:"green"},"阶段2开始！完成进度的同时占领目标点可以获得额外分数！"]
execute as @a at @s run playsound block.note_block.bit master @s ~ ~ ~ 1 0.7 1