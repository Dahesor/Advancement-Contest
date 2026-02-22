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
execute if score #warn calc.DSC matches 1.. run tellraw @a [{text:"[WARN] ",color:"red"},"Orphan Tasks: ", {score:{name:"#warn",objective:"calc.DSC"}}]
