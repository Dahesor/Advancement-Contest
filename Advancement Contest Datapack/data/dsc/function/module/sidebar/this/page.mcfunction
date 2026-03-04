data modify storage sidebar.dah:data ui set value {lore:[{text:""},[{translate:"e.rank",with:["?"],shadow_color:-16579829},{text:"     "},{translate:"e.score",with:["1"]}]]}

data modify storage sidebar.dah:data ui.title set from storage temp time_text

#Score and Rank
execute store result storage run num.i int 1 run scoreboard players get $this score
data modify storage sidebar.dah:data ui.lore[1][2].with[0] set string storage run num.i

#Outpost
execute if data storage team: outpost.this[0] run function dsc:module/sidebar/this/outpost

#===
data modify storage sidebar.dah:data ui.lore append value {text:""}

#Player
execute as @a[tag=sidebar_player] run function dsc:module/sidebar/this/player