scoreboard players set #test calc.DSC 1
execute as 0-0-0-0-0 run function map:sample/color/get_y
execute if score #test calc.DSC matches 1 run say §c???
function map:sample/color/bin/main