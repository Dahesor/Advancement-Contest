function dsc:player/uid/get

scoreboard players operation $this team = @s team
function dsc:core/relate/score__team

function dsc:menu/tasks/bar/render/__pull with storage team: misc
function dsc:menu/tasks/bar/new_data