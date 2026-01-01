title @a times 10 50 10
title @a title ""
title @a subtitle "阶段三：生死逃杀"
tellraw @a [{text:"",color:"yellow"},{translate:"head.game",color:"green"},"阶段3开始！世界边界开始收缩，若团灭则直接淘汰！"]
execute as @a at @s run playsound entity.ender_dragon.ambient master @s ~ ~ ~ 1 0.7 1