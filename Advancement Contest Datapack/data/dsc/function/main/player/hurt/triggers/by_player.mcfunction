advancement revoke @s only dsc:hurt/by_player

scoreboard players operation #new calc.DSC = $gametime calc.DSC
scoreboard players add #new calc.DSC 2400
scoreboard players operation @s hurt_penalty > #new calc.DSC