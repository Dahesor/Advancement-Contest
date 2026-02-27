data modify storage dlm: This_Validation set value {}
data modify storage dlm: cmd set value {this:"return fail"}
execute store result score #length dlm__ run data get storage dlm: validations
execute if score #length dlm__ matches 1.. run function dlm:zzz/on_load/each_entry