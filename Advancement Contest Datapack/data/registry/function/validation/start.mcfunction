data modify storage dsc:task proc_list set value []
data modify storage dsc:task proc_list append from storage dsc:task entry[{node:{node:"root"}}].node.children[]
data modify storage dsc:task entry[{node:{node:"root"}}].linked set value true

execute if data storage dsc:task proc_list[0] run function registry:validation/proc/_this
#data modify storage dsc:task entry[] merge value {node:{node:"root"}}