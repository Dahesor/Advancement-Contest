scoreboard players set #reason outpost 0
execute unless block ~ ~ ~ #replaceable run return run function dsc:module/respawn/op/new/return
execute unless block ~ ~1 ~ #air run return run function dsc:module/respawn/op/new/return
execute unless block ~ ~2 ~ #air run return run function dsc:module/respawn/op/new/return

scoreboard players set #reason outpost 1
scoreboard players add #new outpost 1
scoreboard players operation @s outpost = #new outpost

function dsc:module/respawn/op/new/get_team
scoreboard players operation #new team = @s team
scoreboard players set @s outpost.state 0
data modify entity @s data.outpost.id set value 0
execute store result entity @s data.outpost.id int 1 run scoreboard players get #new outpost
data modify storage custom data set from entity @s data

execute store result score #amount outpost run function dsc:module/respawn/op/new/__get_amount with storage custom data.outpost
execute if score #amount outpost matches 5.. run return run function dsc:module/respawn/op/new/return

setblock ~ ~ ~ beacon
setblock ~ ~1 ~ moving_piston
setblock ~ ~2 ~ moving_piston
playsound block.beacon.activate master @a ~ ~ ~

execute positioned ~ ~0.5 ~ summon item_display run function dsc:module/respawn/op/new/displayer

data modify storage map:main dec append value {x:0,z:0,char:"A",id:1}
execute store result storage map:main dec[-1].id int 1 run scoreboard players get #new outpost
function dsc:module/respawn/op/new/get_char
execute store result storage map:main dec[-1].x int 1 run data get entity @s Pos[0]
execute store result storage map:main dec[-1].z int 1 run data get entity @s Pos[2]

data modify storage team outpost.new set value {id:-1,x:0,y:0,z:0,state:0}
execute store result storage team outpost.new.x int 1 run data get entity @s Pos[0]
execute store result storage team outpost.new.y int 1 run data get entity @s Pos[1]
execute store result storage team outpost.new.z int 1 run data get entity @s Pos[2]
execute store result storage team outpost.new.id int 1 run scoreboard players get #new outpost
function dsc:module/respawn/op/new/__insert_entry with storage custom data.outpost

tag @s remove outpost_init