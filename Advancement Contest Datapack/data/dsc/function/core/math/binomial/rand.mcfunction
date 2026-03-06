execute at 0-0-0-0-9 run loot spawn ~ ~ ~ loot dsc:id/binomial
execute at 0-0-0-0-9 unless entity @e[type=item,distance=..4] run say what?
execute at 0-0-0-0-9 as @e[type=item,distance=..4] if items entity @s contents barrier[custom_data~{__binomial:true}] run function dsc:core/math/binomial/_read_result