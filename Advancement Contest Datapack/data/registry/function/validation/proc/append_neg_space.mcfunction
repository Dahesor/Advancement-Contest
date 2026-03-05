scoreboard players remove #count calc.DSC 2
execute if score #count calc.DSC matches 1.. run data modify storage run n append value '='
execute if score #count calc.DSC matches 2.. run function registry:validation/proc/append_neg_space