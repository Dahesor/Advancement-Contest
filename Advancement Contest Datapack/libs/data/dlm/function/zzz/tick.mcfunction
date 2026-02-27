scoreboard players add $time dlm__ 1

execute if data storage dlm: validations[0] run function dlm:zzz/on_load/start
execute unless score next_event dlm__ matches ..-1 if score $time dlm__ >= next_event dlm__ run function dlm:zzz/timed/act

execute if score #need_gc dlm__ matches 1 run function dlm:zzz/gc/gc