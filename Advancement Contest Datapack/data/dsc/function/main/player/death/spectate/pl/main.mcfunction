tag @s add __spectatee
execute as @a if score @s UID = $this UID run function dsc:main/player/death/spectate/pl/recieve_spectator
tag @s remove __spectatee