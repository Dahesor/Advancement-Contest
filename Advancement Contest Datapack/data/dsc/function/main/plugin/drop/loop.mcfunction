execute unless data storage temp Inv[0] run return fail

#Keep on Death
execute if data storage temp Inv[0].components."minecraft:custom_data"{keeps_on_death:true} run return run function dsc:main/plugin/drop/next

#Drop Amount
scoreboard players set #res calc.DSC 0
scoreboard players set #n calc.DSC 1
execute if data storage temp Inv[0].count store result score #n calc.DSC run data get storage temp Inv[0].count

#tellraw @a {score:{name:"#n",objective:calc.DSC}}
#tellraw @a {score:{name:"#p",objective:calc.DSC}}

execute if score #n calc.DSC matches ..1 store result score #rand calc.DSC run random value 1..100
execute if score #n calc.DSC matches ..1 if score #rand calc.DSC < drop_rate main run scoreboard players set #res calc.DSC 1
execute if score #n calc.DSC matches 2.. run function dsc:core/math/binomial/rand
execute if score #res calc.DSC matches ..0 run return run function dsc:main/plugin/drop/next

#tellraw @a {score:{name:"#res",objective:calc.DSC}}

#Drop Item
execute store result storage run num.i int 1 run data get storage temp Inv[0].Slot
data remove storage temp Inv[0].Slot
data modify storage temp item set from storage temp Inv[0]
data modify storage temp item.count set value 1
execute store result storage temp item.count int 1 run scoreboard players get #res calc.DSC
function dsc:main/plugin/drop/item

#Remove Item
scoreboard players operation #count calc.DSC = #n calc.DSC
scoreboard players operation #count calc.DSC -= #res calc.DSC
execute if score #count calc.DSC matches ..-1 run scoreboard players set #count calc.DSC 0
execute if score $offline calc.DSC matches 0 run function dsc:main/plugin/drop/__clear_backpack with storage run num
execute if score $offline calc.DSC matches 1 run function dsc:main/plugin/drop/__remove_from_data with storage run num

#Next
function dsc:main/plugin/drop/next