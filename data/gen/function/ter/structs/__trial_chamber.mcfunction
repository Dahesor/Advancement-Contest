scoreboard players add $trial gen 1

data modify storage gen l set value {}
data merge storage gen {l:{type:"structure",id:"trial_chambers"}}

execute if score $trial gen matches 1 run data modify storage gen l merge value {x:-256,z:-256}
execute if score $trial gen matches 2 run data modify storage gen l merge value {x:256,z:-256}
execute if score $trial gen matches 3 run data modify storage gen l merge value {x:-256,z:256}
execute if score $trial gen matches 4 run data modify storage gen l merge value {x:256,z:256}

function gen:locate/core/find
return run scoreboard players set $find gen 1
