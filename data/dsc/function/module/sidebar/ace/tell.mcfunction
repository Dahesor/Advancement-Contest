data modify storage temp text set value [{"translate":"head.game",color:"yellow"},{translate:"",color:"aqua"},"团灭！"]
data modify storage temp text[1].translate set from storage team misc.color
data modify storage temp text[1].color set from storage team misc.color
tellraw @a {storage:"temp",nbt:"text",interpret:true}