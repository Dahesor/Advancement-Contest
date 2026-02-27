execute unless data storage dlm: cmd.exe[0] run return 1

scoreboard players set #test_pass dlm__ 0
data modify storage dlm: cmd.this set from storage dlm: cmd.exe[0]
function dlm:zzz/execute/this with storage dlm: cmd
execute unless score #test_pass dlm__ matches 1 run return fail
data remove storage dlm: cmd.exe[0]

return run function dlm:zzz/on_load/each_check