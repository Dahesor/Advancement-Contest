scoreboard players set prepared main 0
gamemode spectator @a
execute at 0-0-0-0-9 run tp @a ~ 500 ~

clear @a
tag @a[scores={team=1..}] add preparing

execute as @a[tag=preparing] run function dsc:main/init/prepare/for_preparer
data modify storage team: map_task set value []
function dsc:core/util/team/friendly_invisible/off
schedule function dsc:main/init/prepare/asking 1t