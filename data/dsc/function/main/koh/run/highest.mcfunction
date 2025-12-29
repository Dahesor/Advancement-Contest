execute if score #red calc.DSC = #max calc.DSC run scoreboard players set #winning calc.DSC 0
execute if score #red calc.DSC > #max calc.DSC run scoreboard players set #winning calc.DSC 1
scoreboard players operation #max calc.DSC > #red calc.DSC
execute if score #green calc.DSC = #max calc.DSC run scoreboard players set #winning calc.DSC 0
execute if score #green calc.DSC > #max calc.DSC run scoreboard players set #winning calc.DSC 2
scoreboard players operation #max calc.DSC > #green calc.DSC
execute if score #blue calc.DSC = #max calc.DSC run scoreboard players set #winning calc.DSC 0
execute if score #blue calc.DSC > #max calc.DSC run scoreboard players set #winning calc.DSC 3
scoreboard players operation #max calc.DSC > #blue calc.DSC
execute if score #yellow calc.DSC = #max calc.DSC run scoreboard players set #winning calc.DSC 0
execute if score #yellow calc.DSC > #max calc.DSC run scoreboard players set #winning calc.DSC 4
scoreboard players operation #max calc.DSC > #yellow calc.DSC
execute if score #light_purple calc.DSC = #max calc.DSC run scoreboard players set #winning calc.DSC 0
execute if score #light_purple calc.DSC > #max calc.DSC run scoreboard players set #winning calc.DSC 5
scoreboard players operation #max calc.DSC > #light_purple calc.DSC
execute if score #white calc.DSC = #max calc.DSC run scoreboard players set #winning calc.DSC 0
execute if score #white calc.DSC > #max calc.DSC run scoreboard players set #winning calc.DSC 6
scoreboard players operation #max calc.DSC > #white calc.DSC
execute if score #gold calc.DSC = #max calc.DSC run scoreboard players set #winning calc.DSC 0
execute if score #gold calc.DSC > #max calc.DSC run scoreboard players set #winning calc.DSC 7
scoreboard players operation #max calc.DSC > #gold calc.DSC
execute if score #gray calc.DSC = #max calc.DSC run scoreboard players set #winning calc.DSC 0
execute if score #gray calc.DSC > #max calc.DSC run scoreboard players set #winning calc.DSC 8
scoreboard players operation #max calc.DSC > #gray calc.DSC