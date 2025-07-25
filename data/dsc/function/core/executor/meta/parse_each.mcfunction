scoreboard players remove $module_count calc.DSC 1
data modify storage dsc:core exe.func set from storage dsc:core task.meta[0].id
function dsc:core/executor/func with storage dsc:core exe
function dsc:core/executor/meta/loaded

data modify storage dsc:core task.meta append from storage dsc:core task.meta[0]
data remove storage dsc:core task.meta[0]
execute if score $module_count calc.DSC matches 1.. run function dsc:core/executor/meta/parse_each