function dsc:main/plugin/op_update/this/del/__change_score with storage team outpost.this[0]

data modify storage team misc.op_del.id set from storage team outpost.this[0].id
data modify storage team misc.op_del.team set from storage team misc.color
function dsc:module/respawn/op/destroy/__remove_entry with storage team misc.op_del
function dsc:module/respawn/op/destroy/__remove_marker with storage team misc.op_del

data remove storage team outpost.this[0]
execute if data storage team outpost.this[0] run function dsc:module/sidebar/ace/remove_op