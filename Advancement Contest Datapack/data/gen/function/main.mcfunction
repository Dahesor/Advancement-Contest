schedule function gen:main 1t replace
title @a times 0 10 0
scoreboard players add $title gen 1
execute if score $title gen matches 12.. run scoreboard players set $title gen 0
execute if score $title gen matches ..2 run title @a[tag=!dev] title ["正在加载地图",{text:"\\",shadow_color:0,font:"dsc:slash"}]
execute if score $title gen matches 3..5 run title @a[tag=!dev] title ["正在加载地图",{text:"|",shadow_color:0,font:"dsc:slash"}]
execute if score $title gen matches 6..8 run title @a[tag=!dev] title ["正在加载地图",{text:"/",shadow_color:0,font:"dsc:slash"}]
execute if score $title gen matches 9.. run title @a[tag=!dev] title ["正在加载地图",{text:"|",shadow_color:0,font:"dsc:slash"}]
title @a[tag=!dev] subtitle "这大概需要三分钟"
effect give @a blindness 5 0 true
execute as @a run attribute @s block_interaction_range modifier add gen:block -100 add_value
execute as @a at @s run tp @s ~ 500 ~

data modify storage map:main dialog.dialog set value {type:"notice",title:"地图加载日志",can_close_with_escape:false,pause:false,after_action:"none",action:{label:""},body:{type:"plain_message",contents:[""],width:400}}
execute positioned ~ 100 ~ summon text_display run function gen:parse_log
function gen:__log with storage map:main dialog


execute if score next gen matches 1.. run return run scoreboard players remove next gen 1

execute if score phase gen matches -100 run return run function gen:ter/b_fetch/start
execute if score phase gen matches -101 run return run function gen:ter/b_fetch/pos_1_r
execute if score phase gen matches -102 run return run function gen:ter/b_fetch/pos_2
execute if score phase gen matches -103 run return run function gen:ter/b_fetch/pos_2_r

execute if score phase gen matches -200 run return run function gen:ter/place/start
execute if score phase gen matches -201 run return run function gen:ter/place/wait_over
execute if score phase gen matches -202 run return run function gen:ter/place/place_over
execute if score phase gen matches -203 run return run function gen:ter/place/tp_loop

execute if score phase gen matches 1 run return run function gen:ter/village/lookup
execute if score phase gen matches 2 run return run function gen:ter/village/recieve
execute if score phase gen matches 3 run return run function gen:ter/village/count
execute if score phase gen matches 4 run return run function gen:ter/village/place_main
execute if score phase gen matches 5 run return run function gen:ter/village/fetch_result
execute if score phase gen matches 6 run return run function gen:ter/village/place_complete


execute if score phase gen matches 10 run return run function gen:ter/structs/ancient_city
execute if score phase gen matches 11 run return run function gen:ter/structs/desert_pyramid
execute if score phase gen matches 12 run return run function gen:ter/structs/trial_chamber
execute if score phase gen matches 13 run return run function gen:ter/structs/igloo
execute if score phase gen matches 14 run return run function gen:ter/structs/mansion
execute if score phase gen matches 15 run return run function gen:ter/structs/jungle_pyramid
execute if score phase gen matches 16 run return run function gen:ter/structs/monument
execute if score phase gen matches 17 run return run function gen:ter/structs/pillager_outpost

execute if score phase gen matches 30 run return run function gen:ter/loader/exe
execute if score phase gen matches 31 run return run function gen:ter/loader/mansion
execute if score phase gen matches 32 run return run function gen:ter/loader/mansion__
execute if score phase gen matches 33 run return run function gen:ter/loader/p_outpost
execute if score phase gen matches 34 run return run function gen:ter/loader/p_outpost__
execute if score phase gen matches 35 run return run function gen:ter/loader/trial_chamber__
execute if score phase gen matches 37 run return run function gen:ter/loader/desert_py
execute if score phase gen matches 38 run return run function gen:ter/loader/desert_py__
execute if score phase gen matches 39 run return run function gen:ter/loader/jungle_py
execute if score phase gen matches 40 run return run function gen:ter/loader/jungle_py__
execute if score phase gen matches 41 run return run function gen:ter/loader/igloo
execute if score phase gen matches 42 run return run function gen:ter/loader/igloo__
execute if score phase gen matches 43 run return run function gen:ter/loader/ocean
execute if score phase gen matches 44 run return run function gen:ter/loader/ocean__

execute if score phase gen matches 100 run return run function gen:ac/port

execute if score phase gen matches 200 run return run function gen:stronghold/place
execute if score phase gen matches 201 run return run function gen:stronghold/recive
execute if score phase gen matches 202 run return run function gen:stronghold/force

execute if score phase gen matches 300 run return run function gen:nether/__fortress
execute if score phase gen matches 301 run return run function gen:nether/fortress
execute if score phase gen matches 302 run return run function gen:nether/__bastion
execute if score phase gen matches 303 run return run function gen:nether/bastion

execute if score phase gen matches 310 run return run function gen:finish

return run function gen:abort