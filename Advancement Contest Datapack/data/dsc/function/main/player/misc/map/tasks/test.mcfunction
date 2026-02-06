return 1
schedule function dsc:main/player/misc/map/tasks/test 3t
execute if block ~ 68 ~ redstone_block run return run setblock ~ 68 ~ air
setblock ~ 68 ~ redstone_block


scoreboard players add test main 1
execute if entity @e[type=item,nbt={Item:{id:"minecraft:redstone"}}] run tellraw @a {score:{name:"test",objective:"main"}}
execute if entity @e[type=item,nbt={Item:{id:"minecraft:redstone"}}] run return run kill @e[type=item,nbt={Item:{id:"minecraft:redstone"}}]
