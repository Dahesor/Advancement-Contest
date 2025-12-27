execute if block ~ ~ ~ minecraft:end_portal_frame run return run function dsc:module/end/exam/found
scoreboard players add #x calc.DSC 1
execute if score #x calc.DSC matches ..11 positioned ~1 ~ ~ run return run function dsc:module/end/fill/locate/exhust/x
return fail