#define score_holder #math.sqrt @ calculator
#define function mech:core/math/sqrt Returns the square root of #math.sqrt @ calculator | Resualt will be /returned and stored in #math.sqrt @ calculator

#>
#@internal mech:math/
#define score_holder #math.private.

scoreboard players operation #math.private.a calc.DSC = #math.sqrt calc.DSC
scoreboard players set #math.private.b calc.DSC 1

execute if score #math.private.a calc.DSC matches 2.. run function dsc:core/math/sqrt/r

scoreboard players operation #math.sqrt calc.DSC = #math.private.a calc.DSC
return run scoreboard players get #math.sqrt calc.DSC