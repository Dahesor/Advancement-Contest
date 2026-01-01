advancement revoke @s only dsc:inventory_changed
execute unless score @s team matches 1.. run return fail
data modify storage run inv set from entity @s Inventory