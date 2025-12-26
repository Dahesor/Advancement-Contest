execute store result score $rand gen run random value 1..1000000000

scoreboard players operation $dx gen = $2x gen
scoreboard players operation $dz gen = $2z gen
scoreboard players operation $dx gen -= $1x gen
scoreboard players operation $dz gen -= $1z gen

scoreboard players operation $dist calc.DSC = $dx gen
scoreboard players operation $_temp calc.DSC = $dz gen
scoreboard players operation $dist calc.DSC *= $dist calc.DSC
scoreboard players operation $_temp calc.DSC *= $_temp calc.DSC
execute store result score #math.sqrt calc.DSC run scoreboard players operation $dist calc.DSC += $_temp calc.DSC
execute store result score $dist calc.DSC run function dsc:core/math/sqrt
scoreboard players operation $rand gen %= $dist calc.DSC

scoreboard players operation $dx gen *= $rand gen
scoreboard players operation $dz gen *= $rand gen
scoreboard players operation $dx gen /= #200 calc.DSC
scoreboard players operation $dz gen /= #200 calc.DSC

scoreboard players operation $dx gen += $1x gen
scoreboard players operation $dz gen += $1z gen