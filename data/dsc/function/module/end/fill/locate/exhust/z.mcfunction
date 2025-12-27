scoreboard players set #y calc.DSC 0
execute if function dsc:module/end/fill/locate/exhust/y run return 1
scoreboard players add #z calc.DSC 1
execute if score #z calc.DSC matches ..11 positioned ~ ~ ~1 run return run function dsc:module/end/fill/locate/exhust/z
return fail