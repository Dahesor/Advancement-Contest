#$(id)

execute if score $linked calc.DSC matches 1 run return fail
scoreboard players set $linked calc.DSC 1

$data modify storage dsc:task this set from storage dsc:task entry[{id:"$(id)"}]
$data modify storage dsc:task entry[{id:"$(id)"}].completed set value true
function dsc:module/adv/rewards/__grant_final_adv with storage dsc:task this

function dsc:module/adv/rewards/normal_reward

execute if data storage dsc:task this{completed:false} run function dsc:module/adv/rewards/champ_reward

function dsc:module/adv/rewards/announce

scoreboard players operation $this team = @s team
execute as @a if score @s team = $this team at @s run function dsc:module/adv/rewards/teammate
function dsc:module/adv/rewards/__grant_adv with storage dsc:task this
tag @a remove __adv_teammate

scoreboard players set $linked calc.DSC 0