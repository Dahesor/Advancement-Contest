scoreboard players set #one_team_left calc.DSC 0
execute as @a[scores={team=1..},tag=!eliminated,limit=1] run scoreboard players operation $this team = @s team
execute as @a[scores={team=1..},tag=!eliminated] unless score @s team = $this team run scoreboard players set #one_team_left calc.DSC 1

execute if score #one_team_left calc.DSC matches 0 run function dsc:main/stream/end/end