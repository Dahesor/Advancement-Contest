function dsc:player/uid/get

data modify storage main: p_tracks set from storage main: player[0].task.result
function dsc:menu/tasks/bar/template
scoreboard players set #e_allow calc.DSC 4
function dsc:menu/tasks/bar/render/insert_text
data modify storage main: bossbar append value "\uE773"
data modify storage main: bossbar append value "\uE775\uE775\uE775\uE775"
function dsc:player/bossbar/modify_self