scoreboard players set warning gen 0
execute store result score time gen run stopwatch query gen:aux 1000
stopwatch remove gen:aux
execute if score time gen matches 200.. run scoreboard players set warning gen 1

scoreboard players set x gen 0
scoreboard players set z gen 0

data modify storage gen out set from block ~ ~ ~ LastOutput
setblock ~ ~ ~ air
execute store result score x gen run data get storage minecraft:gen out.extra[0].with[1].with[0].with[0]
execute store result score z gen run data get storage minecraft:gen out.extra[0].with[1].with[0].with[2]

execute unless score success gen matches 1 run return run function gen:locate/core/not_found

tellraw @a [{text:"[gen:locator] 在 (",color:"dark_gray"},{score:{name:"x",objective:"gen"}}, ", ",{score:{name:"z",objective:"gen"}},")","发现目标，距离",{score:{name:"distance",objective:"gen"}},{text:"",color:"gray",extra:[" (",{score:{name:"time",objective:"gen"}},"ms)"]}]


execute if score distance gen matches 1500.. run return run function gen:locate/core/outside

execute if score x gen <= min_x gen run return run function gen:locate/core/outside
execute if score x gen >= max_x gen run return run function gen:locate/core/outside
execute if score z gen <= min_z gen run return run function gen:locate/core/outside
execute if score z gen >= max_z gen run return run function gen:locate/core/outside

function gen:locate/core/in_range