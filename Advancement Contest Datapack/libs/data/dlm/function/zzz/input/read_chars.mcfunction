data modify storage dlm: char set string storage dlm: string 0 0
data modify storage dlm: string set string storage dlm: string 1
execute if data storage dlm: {char:":"} run return 1

scoreboard players remove #length dlm__ 1
execute if score #length dlm__ matches 1.. run return run function dlm:zzz/input/read_chars
return fail