execute unless data storage run run[0] run return fail

scoreboard players set #valid calc.DSC 1
data modify storage team: misc.id set from storage run run[0]
function dsc:module/adv/rewards/__check_dupplicate with storage team: misc
execute if score #valid calc.DSC matches 1 run data modify storage dsc:task proc_list append from storage run run[0]

data remove storage run run[0]
function dsc:module/adv/rewards/node/check_completed