#201

scoreboard players set next gen 0
scoreboard players set phase gen 300

execute if data storage gen place{success:false} run return run scoreboard players set phase gen 200

data modify storage map:main dec append from storage gen place
data modify storage map:main dec[-1].char set value "h"