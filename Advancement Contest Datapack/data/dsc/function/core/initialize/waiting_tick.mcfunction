execute if score on main matches 1.. run return fail
execute unless score prepared main matches 1 run return fail

title @a title {translate:"resourcepack.check_exist",fallback:"您没有安装资源包！"}
execute as @a at @s unless dimension gen:lobby in gen:lobby run tp @s 0 72 0
effect give @a resistance 2 20 true
effect give @a regeneration 2 20 true
effect give @a saturation 40 0 true
schedule function dsc:core/initialize/waiting_tick 1s