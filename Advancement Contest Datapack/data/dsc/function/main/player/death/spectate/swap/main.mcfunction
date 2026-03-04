scoreboard players operation $this team = @s team
function dsc:core/relate/score__team
function dsc:module/respawn/op/__read_data with storage team: misc

function dsc:main/player/death/spectate/swap/get_target

execute unless score #result UID matches -1000000..1000000 run scoreboard players set #result UID 0

scoreboard players set @s died.swap_cd 5
playsound ui.button.click ui @s ~ ~ ~ 0.8 1.4

scoreboard players operation @s died.spectating = #result UID

function dsc:player/uid/get
data modify storage main: player[0].spectating set value {in:"overworld"}

execute if score @s died.spectating matches 1.. as @a if score @s UID = #result UID run tag @s add __targets
execute if score @s died.spectating matches 1.. run tellraw @s {"text":"[!] 正在旁观",color:"gray","extra":[{"selector":"@a[tag=__targets]",color:"white"}]}
tag @a remove __targets

execute unless score @s died.spectating matches ..-1 run return 1
data modify storage run run set value {id:0}
execute store result storage run run.id int -1 run scoreboard players get @s died.spectating
function dsc:module/respawn/op/__read_from_id with storage run run
tellraw @s {"text":"[!] 正在旁观",color:"gray",extra:[{text:"复活点#",color:"white"},{color:"green",storage:"team",nbt:"outpost.ztemp.count"}]}
data modify storage main: player[0].spectating.x set from storage team: outpost.ztemp.x
data modify storage main: player[0].spectating.y set from storage team: outpost.ztemp.y
data modify storage main: player[0].spectating.z set from storage team: outpost.ztemp.z