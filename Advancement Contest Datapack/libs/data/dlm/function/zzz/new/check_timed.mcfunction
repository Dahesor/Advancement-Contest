execute unless data storage dlm: tt[0].until run return run function dlm:zzz/new/timed_insert
execute store result score #this dlm__ run data get storage dlm: tt[0].until
execute if score #until dlm__ < #this dlm__ run return run function dlm:zzz/new/timed_insert

scoreboard players add #i dlm__ 1
data remove storage dlm: tt[0]

function dlm:zzz/new/check_timed