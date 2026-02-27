data modify storage dlm: proc set value {i:0}
execute store result storage dlm: proc.i int 1 run scoreboard players get #i dlm__
function dlm:zzz/new/__timed_insert with storage dlm: proc