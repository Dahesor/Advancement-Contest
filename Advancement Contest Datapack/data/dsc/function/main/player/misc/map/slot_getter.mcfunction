

execute if items entity @s weapon.offhand filled_map[!custom_data~{team_map:true}] run item modify entity @s weapon.offhand dsc:update_map
execute if items entity @s player.cursor filled_map[!custom_data~{team_map:true}] run item modify entity @s player.cursor dsc:update_map
execute if items entity @s hotbar.0 filled_map[!custom_data~{team_map:true}] run item modify entity @s hotbar.0 dsc:update_map
execute if items entity @s hotbar.1 filled_map[!custom_data~{team_map:true}] run item modify entity @s hotbar.1 dsc:update_map
execute if items entity @s hotbar.2 filled_map[!custom_data~{team_map:true}] run item modify entity @s hotbar.2 dsc:update_map
execute if items entity @s hotbar.3 filled_map[!custom_data~{team_map:true}] run item modify entity @s hotbar.3 dsc:update_map
execute if items entity @s hotbar.4 filled_map[!custom_data~{team_map:true}] run item modify entity @s hotbar.4 dsc:update_map
execute if items entity @s hotbar.5 filled_map[!custom_data~{team_map:true}] run item modify entity @s hotbar.5 dsc:update_map
execute if items entity @s hotbar.6 filled_map[!custom_data~{team_map:true}] run item modify entity @s hotbar.6 dsc:update_map
execute if items entity @s hotbar.7 filled_map[!custom_data~{team_map:true}] run item modify entity @s hotbar.7 dsc:update_map
execute if items entity @s hotbar.8 filled_map[!custom_data~{team_map:true}] run item modify entity @s hotbar.8 dsc:update_map
execute if items entity @s inventory.0 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.0 dsc:update_map
execute if items entity @s inventory.1 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.1 dsc:update_map
execute if items entity @s inventory.2 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.2 dsc:update_map
execute if items entity @s inventory.3 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.3 dsc:update_map
execute if items entity @s inventory.4 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.4 dsc:update_map
execute if items entity @s inventory.5 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.5 dsc:update_map
execute if items entity @s inventory.6 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.6 dsc:update_map
execute if items entity @s inventory.7 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.7 dsc:update_map
execute if items entity @s inventory.8 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.8 dsc:update_map
execute if items entity @s inventory.9 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.9 dsc:update_map
execute if items entity @s inventory.10 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.10 dsc:update_map
execute if items entity @s inventory.11 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.11 dsc:update_map
execute if items entity @s inventory.12 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.12 dsc:update_map
execute if items entity @s inventory.13 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.13 dsc:update_map
execute if items entity @s inventory.14 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.14 dsc:update_map
execute if items entity @s inventory.15 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.15 dsc:update_map
execute if items entity @s inventory.16 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.16 dsc:update_map
execute if items entity @s inventory.17 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.17 dsc:update_map
execute if items entity @s inventory.18 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.18 dsc:update_map
execute if items entity @s inventory.19 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.19 dsc:update_map
execute if items entity @s inventory.20 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.20 dsc:update_map
execute if items entity @s inventory.21 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.21 dsc:update_map
execute if items entity @s inventory.22 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.22 dsc:update_map
execute if items entity @s inventory.23 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.23 dsc:update_map
execute if items entity @s inventory.24 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.24 dsc:update_map
execute if items entity @s inventory.25 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.25 dsc:update_map
execute if items entity @s inventory.26 filled_map[!custom_data~{team_map:true}] run item modify entity @s inventory.26 dsc:update_map

return fail
data remove storage temp item
execute if items entity @s weapon.mainhand filled_map[!custom_data~{team_map:true}] run return run data modify storage temp item set from entity @s SelectedItem
execute if items entity @s weapon.offhand filled_map[!custom_data~{team_map:true}] run return run data modify storage temp item set from entity @s equipment.offhand
