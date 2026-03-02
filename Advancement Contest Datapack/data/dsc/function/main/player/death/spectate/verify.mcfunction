execute if entity @s[tag=aced] run return fail
execute if entity @s[tag=spawn_locked] run return run spectate

execute if score @s died.spectating matches 0 run function dsc:main/player/death/spectate/new_random
spectate

scoreboard players set #valid calc.DSC 0
scoreboard players operation $this UID = @s died.spectating

execute if score @s died.spectating matches 1.. run function dsc:main/player/death/spectate/pl/main
execute if score @s died.spectating matches ..-1 run function dsc:main/player/death/spectate/sp/main

#是否合法
execute if score #valid calc.DSC matches 0 run return run scoreboard players set @s died.spectating 0

#切换旁观对象
execute if score @s died.swap_cd matches 1.. run return run scoreboard players remove @s died.swap_cd 1
execute if predicate dsc:keys/push/a run return run function dsc:main/player/death/spectate/swap/main
execute if predicate dsc:keys/push/d run return run function dsc:main/player/death/spectate/swap/main