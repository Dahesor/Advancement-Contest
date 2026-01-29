execute unless score on main matches 1.. run return fail
execute if score @s[tag=!eliminated] team matches 1.. run return fail
execute unless score centered main matches 1 run return fail

function dsc:menu/map/granted