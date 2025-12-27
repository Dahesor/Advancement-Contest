scoreboard players operation $this outpost = @s outpost
execute on vehicle if entity @s[type=item_display] run function dsc:module/respawn/op/destroy/destroy_display

data modify storage custom data set from entity @s data

function dsc:module/respawn/op/destroy/__remove_marker with storage custom data.outpost
fill ~ ~1 ~ ~ ~2 ~ air replace moving_piston
function dsc:module/respawn/op/destroy/__remove_entry with storage custom data.outpost
kill