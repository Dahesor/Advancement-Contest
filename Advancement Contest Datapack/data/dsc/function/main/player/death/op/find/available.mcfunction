scoreboard players operation $this team = @s team
function dsc:core/relate/score__team
function dsc:main/player/death/menu/next/__read_data with storage team: misc

scoreboard players set @s died.revive_target -1
scoreboard players set @s died.expected_time -1

execute if data storage team: outpost.this[0] run function dsc:main/player/death/op/find/iterate