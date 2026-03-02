
execute if entity @s[gamemode=spectator] run return fail
scoreboard players set #valid calc.DSC 1

spectate @s @a[limit=1,tag=__spectatee]