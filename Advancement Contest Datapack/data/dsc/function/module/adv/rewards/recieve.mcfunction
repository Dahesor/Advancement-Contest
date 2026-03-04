#$(id)

execute unless score enable_adv main matches 1 run return fail
execute unless score @s team matches 1.. run return fail
execute if score $linked calc.DSC matches 1 run return fail

#Duplicate check
scoreboard players operation $this team = @s team
function dsc:core/relate/score__team
scoreboard players set #valid calc.DSC 1
$data modify storage team: misc.id set value "$(id)"
function dsc:module/adv/rewards/__check_dupplicate with storage team: misc
execute if score #valid calc.DSC matches 0 run return fail
#Add to completed list
function dsc:module/adv/rewards/__add_to_list with storage team: misc

scoreboard players set $linked calc.DSC 1

$data modify storage dsc:task this set from storage dsc:task entry[{id:"$(id)"}]
$data modify storage dsc:task entry[{id:"$(id)"}].completed set value true
$data modify storage team: track_list.mod[{id:"$(id)"}].completed set value true

function dsc:module/adv/rewards/__grant_final_adv with storage dsc:task this
data modify storage dsc:task proc_list set value []
data modify storage run run set value []
data modify storage run run append from storage dsc:task this.node.children[]
function dsc:module/adv/rewards/node/__get_team with storage team: misc

#Filter out completed nodes
##### id not id
function dsc:module/adv/rewards/node/check_completed
function dsc:module/adv/rewards/node/compute_nodes
$data modify storage team: misc.id set value "$(id)"
##### id not id

function dsc:module/adv/rewards/node/__remove_this with storage team: misc
function dsc:module/adv/rewards/node/__mark_completed with storage team: misc
function dsc:module/adv/rewards/node/__write_team with storage team: misc

function dsc:module/adv/rewards/normal_reward

execute if data storage dsc:task this{completed:false} run function dsc:module/adv/rewards/champ_reward
function dsc:module/adv/rewards/announce

scoreboard players operation $this team = @s team
execute as @a if score @s team = $this team at @s run function dsc:module/adv/rewards/teammate
execute as @a if score @s team = $this team at @s run function dsc:module/adv/rewards/__grant_adv with storage dsc:task this
tag @a remove __adv_teammate

scoreboard players set $linked calc.DSC 0

execute as @a[scores={team=1..}] run function dsc:menu/tasks/bar/pull