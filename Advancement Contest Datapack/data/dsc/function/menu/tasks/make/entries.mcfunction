execute unless data storage main: p_tracks[0].id run return fail

function dsc:menu/tasks/bar/template
scoreboard players set #e_allow calc.DSC 4
function dsc:menu/tasks/bar/render/insert_text
data modify storage main: bossbar append value "\uE773"

execute store result storage run b.1 int 1 run scoreboard players add #e calc.DSC 1
execute store result storage run b.2 int 1 run scoreboard players add #e calc.DSC 1
execute store result storage run b.3 int 1 run scoreboard players add #e calc.DSC 1
execute store result storage run b.4 int 1 run scoreboard players add #e calc.DSC 1
function dsc:menu/tasks/make/triggers with storage run b

data modify storage temp dialog.dialog.body[-1].contents append from storage main: bossbar
data modify storage temp dialog.dialog.body[-1].contents append value "\n\n\n\n"
#data modify storage temp dialog.dialog.body[0].contents append value {text:"\uE77A",font:"dsc:bitmap/space"}

function dsc:menu/tasks/make/entries