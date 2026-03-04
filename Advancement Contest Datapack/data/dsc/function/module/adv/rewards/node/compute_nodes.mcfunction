execute unless data storage dsc:task proc_list[0] run return fail


data modify storage run id set value {id:""}
data modify storage run id.id set from storage dsc:task proc_list[0]

scoreboard players set #valid calc.DSC 1
function dsc:module/adv/rewards/node/__duplicates with storage run id
execute if score #valid calc.DSC matches 0 run return run function dsc:module/adv/rewards/node/next_node

function dsc:module/adv/rewards/node/__get_node with storage run id
function dsc:module/adv/rewards/node/next_node