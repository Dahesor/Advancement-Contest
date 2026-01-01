scoreboard players operation $this team = @a[scores={team=1..},tag=!eliminated,limit=1] team
execute as @a if score @s team = $this team run tag @s add uhc_winner

function dsc:core/relate/score__team
scoreboard players set #scale calc.DSC 200
function dsc:core/relate/__scale_score with storage team misc

scoreboard players set on main 0
gamemode spectator @a
gamerule spectators_generate_chunks true

title @a times 10 50 10
title @a title "游戏结束"
title @a subtitle ""
execute as @a at @s run playsound ui.toast.challenge_complete master @s ~ ~ ~ 1 0.7 1

function dsc:main/stream/end/scores/all