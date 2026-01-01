summon text_display ~ ~ ~ {text:{text:""},UUID:[I;0,0,0,1]}
data modify storage run num set value {i:0}
data modify storage temp text_storage.s set value [{translate:"e.op.s",shadow_color:-16579829},{text:"⛳"}]
data modify storage temp text_storage.w set value [{translate:"e.op.w",shadow_color:-16579829},{text:"⛴"}]
data modify storage temp text_storage.d set value [{translate:"e.op.d",shadow_color:-16579829},{text:"⛵"}]
data modify storage temp text_storage.l set value [{translate:"e.op.l",shadow_color:-16579829},{text:"⛶"}]

execute as @a[scores={team=1},limit=1,tag=!eliminated] run function dsc:module/sidebar/teams/red
execute as @a[scores={team=2},limit=1,tag=!eliminated] run function dsc:module/sidebar/teams/green
execute as @a[scores={team=3},limit=1,tag=!eliminated] run function dsc:module/sidebar/teams/blue
execute as @a[scores={team=4},limit=1,tag=!eliminated] run function dsc:module/sidebar/teams/yellow
execute as @a[scores={team=5},limit=1,tag=!eliminated] run function dsc:module/sidebar/teams/light_purple
execute as @a[scores={team=6},limit=1,tag=!eliminated] run function dsc:module/sidebar/teams/white
execute as @a[scores={team=7},limit=1,tag=!eliminated] run function dsc:module/sidebar/teams/gold
execute as @a[scores={team=8},limit=1,tag=!eliminated] run function dsc:module/sidebar/teams/gray

kill 0-0-0-0-1