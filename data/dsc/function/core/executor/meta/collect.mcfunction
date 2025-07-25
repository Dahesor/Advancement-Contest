data modify storage dsc:core task.in_init set value []
data modify storage dsc:core task.on_tick set value []
data modify storage dsc:core task.per_sec set value []

execute store result score $module_count calc.DSC run data get storage dsc:core task.meta
execute unless score $module_count calc.DSC matches 1.. run return 1
function dsc:core/executor/meta/parse_each