scoreboard players add $attempt gen 1
execute if score $attempt gen matches 3.. run return fail

scoreboard players set next gen 0
scoreboard players set phase gen -203

function gen:ter/place/__tp with storage gen place
scoreboard players set $wait gen 120

tellraw @a[tag=dev] [{text:"[gen:place] 即将重试……",color:"dark_gray"}," Attempt",{text:"(",color:"red",extra:[{score:{"name":"$attempt",objective:"gen"}},"/2)"]}]