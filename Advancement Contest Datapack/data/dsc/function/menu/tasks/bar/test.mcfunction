function dsc:menu/tasks/bar/template

data modify storage main: bossbar[1][0].extra[2] merge value {translate:"k.mine_stone",font:"dsc:tasks/icon_alpha_1"}
data modify storage main: bossbar[1][1].translate set value "ask.mine_stone"
data modify storage main: bossbar[1][3].translate set value "sk.mine_stone.1"

data modify storage main: bossbar[2][0].extra[2] merge value {translate:"k.obtain_armor",font:"dsc:tasks/icon_alpha_1"}
data modify storage main: bossbar[2][1].translate set value "ask.obtain_armor"
data modify storage main: bossbar[2][3].translate set value "sk.obtain_armor.1"
#data modify storage main: bossbar[2][0].extra[0] set value "\uEAAB"

data modify storage main: bossbar[3][0].extra[2] merge value {translate:"k.get_crafting_table",font:"dsc:tasks/icon_alpha_1"}
data modify storage main: bossbar[3][1].translate set value "ask.get_crafting_table"
#data modify storage main: bossbar[3][3].font set value "dsc:bitmap/line_2_major"
#data modify storage main: bossbar[3][5].font set value "dsc:bitmap/line_3_major"
data modify storage main: bossbar[3][3].translate set value "sk.get_crafting_table.1"
#data modify storage main: bossbar[3][5].translate set value "sk.obtain_armor.2"
#data modify storage main: bossbar[3][0].extra[0] set value "\uEAAB"
#data modify storage main: bossbar[3][-1] set value "\uE774"

data modify storage main: bossbar[4][0].extra[2] merge value {translate:"k.adventuring_time",font:"dsc:tasks/icon_alpha_1"}
data modify storage main: bossbar[4][1].translate set value "ask.adventuring_time"
data modify storage main: bossbar[4][3].translate set value "sk.adventuring_time.1"
data modify storage main: bossbar[4][5].translate set value "sk.adventuring_time.2"
data modify storage main: bossbar[4][0].extra[0] set value "\uEAAB"

function dsc:player/bossbar/modify_self
function dsc:player/bossbar/show_self