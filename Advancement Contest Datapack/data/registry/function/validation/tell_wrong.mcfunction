tellraw @a [{text:"[WARN] ",color:"red"},"Orphan Task ", {storage:"dsc:task",nbt:"temp[0].id",color:"yellow",hover_event:{action:"show_text",value:{storage:"dsc:task",nbt:"temp[0].display.title",interpret:true}}}," -> ", {storage:"dsc:task",nbt:"temp[0].advancement",color:"dark_gray"}]

data remove storage dsc:task temp[0]
execute if data storage dsc:task temp[0] run function registry:validation/tell_wrong