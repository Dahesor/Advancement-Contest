function dsc:module/respawn/op/check/write_data with entity @s data.outpost
execute if score @s outpost.state matches 2.. on vehicle run data modify entity @s Glowing set value true
execute unless score @s outpost.state matches 2.. on vehicle run data modify entity @s Glowing set value false