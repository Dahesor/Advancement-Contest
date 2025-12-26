#34

scoreboard players set next gen 1
scoreboard players set phase gen 30

execute if data storage gen place{success:true} run scoreboard players add has_p_outpost gen 1
execute if data storage gen place{success:true} run data modify storage map:main dec append from storage gen place
execute if data storage gen place{success:true} run data modify storage map:main dec[-1].char set value "p"


execute if score $p_post_att gen matches ..8 if score has_p_outpost gen < $target_outpost gen run scoreboard players remove $exe gen 1