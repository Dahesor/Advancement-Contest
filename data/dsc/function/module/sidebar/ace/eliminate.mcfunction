data modify storage temp text set value [{"translate":"head.game",color:"yellow"},{translate:"",color:"aqua"},"被淘汰！"]
data modify storage temp text[1].translate set from storage team misc.color
data modify storage temp text[1].color set from storage team misc.color
tellraw @a {storage:"temp",nbt:"text",interpret:true}

#Hide Sidebar
function sidebar.dah:visible/hide_color with storage team misc

#Scale Score
execute unless score on main matches 1 run return 42
function dsc:core/relate/count_team_left
execute if score #count team matches 0 run scoreboard players set #scale calc.DSC 200
execute if score #count team matches 1 run scoreboard players set #scale calc.DSC 175
execute if score #count team matches 2 run scoreboard players set #scale calc.DSC 150
execute if score #count team matches 3 run scoreboard players set #scale calc.DSC 140
execute if score #count team matches 4 run scoreboard players set #scale calc.DSC 130
execute if score #count team matches 5 run scoreboard players set #scale calc.DSC 120
execute if score #count team matches 6 run scoreboard players set #scale calc.DSC 110
execute if score #count team matches 7 run scoreboard players set #scale calc.DSC 100
function dsc:core/relate/__scale_score with storage team misc