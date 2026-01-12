scoreboard players set #red calc.DSC 0
scoreboard players set #green calc.DSC 0
scoreboard players set #blue calc.DSC 0
scoreboard players set #yellow calc.DSC 0
scoreboard players set #light_purple calc.DSC 0
scoreboard players set #white calc.DSC 0
scoreboard players set #gold calc.DSC 0
scoreboard players set #gray calc.DSC 0
execute as @a[gamemode=survival,scores={team=1..},distance=..25] run function dsc:main/koh/run/add_self

scoreboard players set #winning calc.DSC 0
scoreboard players set #max calc.DSC 0
function dsc:main/koh/run/highest

scoreboard players operation koh_winning main = #winning calc.DSC

execute if score koh_winning main matches 1.. on vehicle run waypoint modify @s style set dsc:hill
execute if score koh_winning main matches 0 on vehicle run function dsc:main/koh/run/cases/contested

execute if score koh_winning main matches 1 run function dsc:main/koh/run/cases/red
execute if score koh_winning main matches 2 run function dsc:main/koh/run/cases/green
execute if score koh_winning main matches 3 run function dsc:main/koh/run/cases/blue
execute if score koh_winning main matches 4 run function dsc:main/koh/run/cases/yellow
execute if score koh_winning main matches 5 run function dsc:main/koh/run/cases/light_purple
execute if score koh_winning main matches 6 run function dsc:main/koh/run/cases/white
execute if score koh_winning main matches 7 run function dsc:main/koh/run/cases/gold
execute if score koh_winning main matches 8 run function dsc:main/koh/run/cases/gray