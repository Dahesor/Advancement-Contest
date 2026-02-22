kill 0-0-0-0-2
summon item_display ~ ~ ~ {UUID:[I;0,0,0,2],item:{id:"filled_map",count:1,components:{custom_data:{keeps_on_death:true,team_map:true},item_name:{text:"团队地图",color:"green"},lore:["",{text:"小心别丢掉了哦",color:"gray"},"",{"translate": "keeps_on_death","color":"green","italic": false}],"minecraft:map_id":1,enchantment_glint_override:true,item_model:"dsc:system/map"}}}
execute store result entity 0-0-0-0-2 item.components."minecraft:map_id" int 1 run scoreboard players get $map_id calc.DSC
execute as 0-0-0-0-2 run loot replace entity @a[tag=__give_map] weapon.offhand loot dsc:props/map_from_entity
kill 0-0-0-0-2