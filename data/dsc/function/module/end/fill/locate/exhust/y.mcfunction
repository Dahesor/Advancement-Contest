scoreboard players set #x calc.DSC 0
execute if function dsc:module/end/fill/locate/exhust/x run return 1
scoreboard players add #y calc.DSC 1
execute if score #y calc.DSC matches ..11 positioned ~ ~1 ~ run return run function dsc:module/end/fill/locate/exhust/y
return fail