data modify storage dsc:task proc_list set value []


data modify storage dsc:task proc_list append from storage dsc:task entry[{node:{node:"root"}}].node.children[]
data modify storage dsc:task entry[{node:{node:"root"}}].linked set value true
data modify storage dsc:task new append from storage dsc:task entry[{node:{node:"root"}}]
execute if data storage dsc:task proc_list[0] run function registry:validation/proc/_this

data modify storage dsc:task proc_list append from storage dsc:task entry[{node:{node:"conditional"}}].node.children[]
data modify storage dsc:task entry[{node:{node:"conditional"}}].linked set value true
data modify storage dsc:task new append from storage dsc:task entry[{node:{node:"conditional"}}]
execute if data storage dsc:task proc_list[0] run function registry:validation/proc/_this