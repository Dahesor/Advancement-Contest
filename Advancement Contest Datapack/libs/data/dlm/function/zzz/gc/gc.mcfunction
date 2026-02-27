execute store result score #dimension dlm__ run data get storage dlm: data
scoreboard players set #this dlm__ 0
data modify storage dlm: result_pos set value {x:0,z:0}
execute if score #dimension dlm__ matches 1.. run function dlm:zzz/gc/each_dim

scoreboard players set #need_gc dlm__ 0