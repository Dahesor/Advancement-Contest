execute if entity @s[tag=aced] run return run function dsc:main/player/death/menu/close
execute if score $this input matches -1 run return run function dsc:main/player/death/menu/arrange
execute if score $this input matches -2 run return run function dsc:main/player/death/menu/close
execute if score $this input matches -999 run return run function dsc:main/player/death/menu/pause/self

execute at @s run playsound ui.button.click master @s ~ ~ ~ 0.9 1.3
scoreboard players operation @s died.revive_target = $this input
scoreboard players operation $this team = @s team
function dsc:core/relate/score__team
function dsc:main/player/death/menu/next/__read_data with storage team: misc
data modify storage run num set value {id:0}
execute store result storage run num.id int 1 run scoreboard players get $this input
function dsc:main/player/death/menu/__get_spawn_point with storage run num
execute store result score @s died.expected_time run data get storage team: outpost.ztemp.next_spawn
function dsc:main/player/death/menu/arrange