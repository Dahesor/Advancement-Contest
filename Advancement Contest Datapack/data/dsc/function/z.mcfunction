scoreboard players set #n calc.DSC 2
scoreboard players set #p calc.DSC 30
function dsc:core/math/binomial/rand
tellraw @a {score:{name:"#res",objective:calc.DSC}}
execute if score #res calc.DSC matches 2.. run return run say hhhh
schedule function dsc:z 1t