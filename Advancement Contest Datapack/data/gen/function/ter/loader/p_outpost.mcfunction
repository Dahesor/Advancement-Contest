#33
scoreboard players set next gen 0
scoreboard players set phase gen 30

scoreboard players add $p_post_att gen 1
function gen:locate/core/read
execute if score distance gen matches ..4 unless score $p_post_att gen matches 8.. run return run scoreboard players remove $exe gen 1
execute if score distance gen matches ..4 run return fail

data modify storage gen gen_log prepend value [{text:"\n[gen:main] 尝试决定放置一个掠夺者前哨站\n",color:"gray"}]

function gen:ter/place/call

scoreboard players operation $px gen += zero_x gen
scoreboard players operation $pz gen += zero_z gen
execute store result storage gen place.x int 1 run scoreboard players get $px gen
execute store result storage gen place.z int 1 run scoreboard players get $pz gen

data modify storage gen place.id set value "gen:pillager_outpost"
data modify storage gen place.fallback set value 34