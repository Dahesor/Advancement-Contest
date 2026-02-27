execute unless data storage dlm: cmd.exe[0] run return fail

data modify storage dlm: cmd.this set from storage dlm: cmd.exe[0]
function dlm:zzz/execute/this with storage dlm: cmd

data remove storage dlm: cmd.exe[0]
function dlm:zzz/on_load/run_cmds