execute unless score on main matches 1.. unless entity @s[scores={team=1..}] run return fail
dialog clear @s
execute if entity @s[gamemode=spectator] run return run tellraw @s {text:"您已死亡",color:"red"}

execute if score @s hurt_penalty > $gametime calc.DSC run return run function dsc:main/player/death/redeploy/still_hurt

#Main Logic
scoreboard players set #has_op calc.DSC 0

#Check if has outpost
scoreboard players operation $this team = @s team
execute as @e[type=marker,tag=outpost,distance=..3.5,scores={outpost.state=-1..}] if score @s team = $this team run scoreboard players set #has_op calc.DSC 1

#Sound
playsound entity.enderman.death master @s ~ ~ ~ 1 1 1
tellraw @a ["[☠] ",{selector:"@s"},{text:"重新部署"}]

#Drop if needed
execute if score #has_op calc.DSC matches 0 run function dsc:main/player/death/redeploy/drop
gamemode spectator

#Death
scoreboard players reset @s death
gamemode spectator
tag @s add dead
tag @s add __dead_prepare
scoreboard players set @s died.revive_target -1
scoreboard players set @s died.expected_time -1
function dsc:main/player/death/op/find/available

#
scoreboard players set @s revive_time 400