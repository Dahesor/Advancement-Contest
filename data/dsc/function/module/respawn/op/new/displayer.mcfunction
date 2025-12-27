tag @s add __new_displayer
data modify entity @s item set value {id:"white_dye",components:{item_model:"dsc:outpost/mod",custom_model_data:{strings:["none"]}}}
data modify entity @s transformation merge value {scale:[1.02f,1.02f,1.02f],translation:[-0.005f,-0.005f,-0.005f]}
data modify entity @s item.components."minecraft:custom_model_data".strings[0] set from storage custom data.outpost.team

tag @s add outpost.display
scoreboard players operation @s outpost = #new outpost
summon armor_stand ~ ~ ~ {Tags:["outpost.as","__new_ac"],attributes:[{base:50.0d,id:"waypoint_transmit_range"}],Small:1b,Marker:1b,Invisible:1b}

ride @e[type=armor_stand,limit=1,distance=..10,tag=__new_ac,tag=outpost.as] mount @s
ride @e[type=marker,limit=1,distance=..10,tag=outpost_init,tag=outpost] mount @s
execute on passengers run function dsc:module/respawn/op/new/waypoint
tag @s remove __new_displayer

data modify entity @s view_range set value 0.7d
execute if score #new team matches 1 run data modify entity @s glow_color_override set value 16711680
execute if score #new team matches 2 run data modify entity @s glow_color_override set value 65306
execute if score #new team matches 3 run data modify entity @s glow_color_override set value 30719
execute if score #new team matches 4 run data modify entity @s glow_color_override set value 16776960
execute if score #new team matches 5 run data modify entity @s glow_color_override set value 16711888
execute if score #new team matches 6 run data modify entity @s glow_color_override set value 16777215
execute if score #new team matches 7 run data modify entity @s glow_color_override set value 16750848
execute if score #new team matches 8 run data modify entity @s glow_color_override set value 8553090