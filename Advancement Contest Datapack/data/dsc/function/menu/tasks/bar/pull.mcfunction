function dsc:player/uid/get

execute unless score @s team matches 1.. run return run function dsc:menu/tasks/bar/spectator_pull
execute unless score on main matches 1.. run return run function dsc:menu/tasks/bar/spectator_pull

scoreboard players operation $this team = @s team
function dsc:core/relate/score__team

function dsc:menu/tasks/bar/render/__pull with storage team: misc
function dsc:menu/tasks/bar/new_data