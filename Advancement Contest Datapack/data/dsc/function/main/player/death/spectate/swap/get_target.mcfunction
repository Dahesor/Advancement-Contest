data modify storage run list set value []
data modify storage run list2 set value []
data modify storage run list2 append from storage team: outpost.this[].id
function dsc:main/player/death/spectate/swap/clist
execute as @a[gamemode=!spectator] if score @s team = $this team run function dsc:main/player/death/spectate/swap/add_self
data modify storage run list2 set from storage run list

scoreboard players set #has_result died.spectating 0
scoreboard players operation #base died.spectating = @s died.spectating
execute if predicate dsc:keys/push/a run return run function dsc:main/player/death/spectate/swap/swap_left
execute if predicate dsc:keys/push/d run return run function dsc:main/player/death/spectate/swap/swap_right