scoreboard players operation #math.private.a calc.DSC += #math.private.b calc.DSC
scoreboard players operation #math.private.a calc.DSC /= #2 calc.DSC
scoreboard players operation #math.private.b calc.DSC = #math.sqrt calc.DSC
scoreboard players operation #math.private.b calc.DSC /= #math.private.a calc.DSC
execute if score #math.private.a calc.DSC > #math.private.b calc.DSC run function dsc:core/math/sqrt/r