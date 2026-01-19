loot give @s loot dsc:package/initial
loot give @s loot dsc:props/op
execute unless entity @s[tag=__give_map] run return fail
scoreboard players operation $this team = @s team
scoreboard players set #count calc.DSC 0
execute as @a if score @s team = $this team run scoreboard players add #count calc.DSC 1
execute as @a if score @s team = $this team run tag @s remove __give_map
loot give @s loot dsc:package/maps