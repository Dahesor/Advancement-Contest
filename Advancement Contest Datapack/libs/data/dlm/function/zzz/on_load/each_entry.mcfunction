data modify storage dlm: cmd.exe set from storage dlm: validations[0].tests

scoreboard players set #del dlm__ 0

execute if function dlm:zzz/on_load/each_check run function dlm:zzz/on_load/passed

execute unless score #del dlm__ matches 1 run data modify storage dlm: validations append from storage dlm: validations[0]
data remove storage dlm: validations[0]
scoreboard players remove #length dlm__ 1
execute if score #length dlm__ matches 1.. run function dlm:zzz/on_load/each_entry