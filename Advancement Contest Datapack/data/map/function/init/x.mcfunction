data modify storage run l append value {color:[],update:1b,ascii:["Ҩ","Ҩ","Ҩ","Ҩ"]}
scoreboard players add $it map 1
execute if score $it map < size map run function map:init/x