execute if score #attacker UID = $this UID run return fail
execute if score #attacker UID matches ..0 run return fail
execute unless score $this player_bounty matches 1.. run return fail

scoreboard players operation #gain player_bounty = $this player_bounty
execute store result score #holder calc.DSC store result score #added player_bounty run scoreboard players operation #gain player_bounty /= #2 calc.DSC
execute unless score #gain player_bounty matches 1.. run return fail

scoreboard players operation $loser team = $this team
scoreboard players operation $loser player_bounty = $this player_bounty

scoreboard players operation #added player_bounty /= #2 calc.DSC
scoreboard players operation #holder calc.DSC %= #2 calc.DSC
execute if score #holder calc.DSC matches 1 run scoreboard players add #added player_bounty 1

execute as @a if score @s UID = #attacker UID run tag @s add __bounty_owner
execute as @a[tag=__bounty_owner,limit=1] run function dsc:main/player/hurt/bounty/receiver

#Text and Sound
execute as @a at @s run playsound entity.wither.break_block master @s ~ ~ ~ 0.3 1.2
function dsc:main/player/hurt/bounty/bounty_text

#Remove Bounty
scoreboard players operation $this player_bounty = $loser player_bounty
execute store result score #temp2 calc.DSC run scoreboard players operation #temp calc.DSC = $this player_bounty

scoreboard players operation $this player_bounty -= #gain player_bounty

execute if score $this player_bounty matches ..0 run scoreboard players set $this player_bounty 0
scoreboard players operation #temp calc.DSC -= $this player_bounty
scoreboard players remove #temp2 calc.DSC 10
scoreboard players operation #temp calc.DSC < #temp2 calc.DSC

scoreboard players operation $new_score calc.DSC = #temp calc.DSC
scoreboard players operation $this team = $loser team
execute if score $new_score calc.DSC matches 1.. run function dsc:module/team/remove_score_self_notify

tag @a remove __bounty_owner