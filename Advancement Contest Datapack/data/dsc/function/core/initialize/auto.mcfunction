#Get corner
scoreboard players set #vmo.x calc.DSC -64
scoreboard players set #vmo.z calc.DSC -64
scoreboard players set #vmo.dx calc.DSC 0
scoreboard players set #vmo.dz calc.DSC 0
scoreboard players set #vmo.count calc.DSC 0
scoreboard players set #vmo.success calc.DSC 0
stopwatch remove gen:validate
stopwatch create gen:validate
function gen:validate/reset_text
function gen:validate/to_origin