execute at 0-0-0-0-9 run tp @a ~ 500 ~
gamemode adventure @a[tag=preparing]
execute if entity @a[tag=preparing] run schedule function dsc:main/init/prepare/asking 1t

title @a times 0 20 0
title @a[tag=preparing] title "右键以代表队伍准备开始"
title @a[tag=!preparing] title "等待所有队伍做好准备……"
execute as @a[tag=preparing] run function dsc:main/init/prepare/for_preparer
effect give @a blindness 2 0 true
effect give @a invisibility 2 0 true
execute unless entity @a[tag=preparing] run function dsc:main/init/team/prepare
execute unless entity @a[tag=preparing] run function dsc:main/init/prepare/build_maps
execute as @e[type=item] if items entity @s contents map[custom_data~{__prepare_item:true}] run kill @s