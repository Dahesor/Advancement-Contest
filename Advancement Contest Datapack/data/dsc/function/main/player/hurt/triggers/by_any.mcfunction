advancement revoke @s only dsc:hurt/by_any

scoreboard players operation #new calc.DSC = $gametime calc.DSC
scoreboard players add #new calc.DSC 600
scoreboard players operation @s hurt_penalty > #new calc.DSC