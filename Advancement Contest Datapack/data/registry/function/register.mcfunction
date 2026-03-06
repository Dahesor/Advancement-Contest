data modify storage dsc:task new set value []
function #registry:reg
data modify storage dsc:task entry set from storage dsc:task new
data modify storage dsc:task entry[].completed set value false
data modify storage dsc:task entry[].linked set value false
data modify storage dsc:task new set value []

function registry:validation/start

data modify storage dsc:task temp set from storage dsc:task entry
data remove storage dsc:task temp[{linked:true}]
execute store result score #warn calc.DSC run data get storage dsc:task temp
execute if data storage dsc:task temp[0] run function registry:validation/tell_wrong

execute unless score #warn calc.DSC matches 1.. run data modify storage dsc:task entry set from storage dsc:task new
data modify storage dsc:task new set value []

#Report
    execute if score #warn calc.DSC matches 1.. run tellraw @a [{text:"[WARN] ",color:"red"},"Orphan Tasks: ", {score:{name:"#warn",objective:"calc.DSC"}}]
    execute store result score #count calc.DSC run data get storage dsc:task entry
    execute unless score #warn calc.DSC matches 1.. run tellraw @a [{text:"Registered ",color:"green"}, {score:{name:"#count",objective:"calc.DSC"}}," Tasks. All checks passed!"]
    execute store result score #count calc.DSC if data storage dsc:task entry[{node:{node:"root"}}]
    tellraw @a [{text:" - Roots: ",color:"gray",hover_event:{action:"show_text",value:{nbt:"entry[{node:{node:\"root\"}}].id",storage:"dsc:task",separator:"\n",color:"green"}}}, {score:{name:"#count",objective:"calc.DSC"}}]
    execute store result score #count calc.DSC if data storage dsc:task entry[{node:{node:"conditional"}}]
    tellraw @a [{text:" - Conditional Roots: ",color:"gray",hover_event:{action:"show_text",value:{nbt:"entry[{node:{node:\"conditional\"}}].id",storage:"dsc:task",separator:"\n",color:"green"}}}, {score:{name:"#count",objective:"calc.DSC"}}]
    execute store result score #count calc.DSC if data storage dsc:task entry[{node:{node:"challenge"}}]
    tellraw @a [{text:" - Challenge: ",color:"gray",hover_event:{action:"show_text",value:{nbt:"entry[{node:{node:\"challenge\"}}].id",storage:"dsc:task",separator:"\n",color:"green"}}}, {score:{name:"#count",objective:"calc.DSC"}}]
#Report

data modify storage team: track_list.mod set value []
data modify storage dsc:task proc_list set value []
data modify storage dsc:task temp set from storage dsc:task entry
function registry:validation/tree

data modify storage run k set value []
data modify storage run k append from storage team: track_list.mod[{node:"challenge"}]
data remove storage team: track_list.mod[{node:"challenge"}]
data modify storage team: track_list.mod append from storage run k[]

data modify storage run k set value []
data modify storage run k append from storage team: track_list.mod[{pin:true}]
data remove storage team: track_list.mod[{pin:true}]
data modify storage team: track_list.mod prepend from storage run k[]
data modify storage run k set value []

data modify storage team: track_list.cache set value []
data modify storage team: track_list.cache append from storage team: track_list.mod[{node:"root"}]