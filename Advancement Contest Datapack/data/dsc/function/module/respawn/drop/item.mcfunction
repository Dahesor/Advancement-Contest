data modify storage temp item set from entity @s Item
execute unless data storage temp item.components."minecraft:lock".components."minecraft:custom_data".outpost.team run return run kill

execute store result score $this team run data get storage temp item.components."minecraft:custom_model_data".floats[0]
function dsc:core/relate/score__team
execute store result score #diff calc.DSC run data modify storage team: misc.color set from storage temp item.components."minecraft:lock".components."minecraft:custom_data".outpost.team

execute unless score #diff calc.DSC matches 0 run return run kill

function dsc:module/respawn/loot/drop_color with storage team: misc
kill