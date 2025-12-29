execute store result score #length calc.DSC run data get storage koh temp
execute store result score $rand calc.DSC run random value 1..10000000

#storage run num -> {i:0}
execute store result storage run num.i int 1 run scoreboard players operation $rand calc.DSC %= #length calc.DSC
function dsc:main/koh/pick/__shuffle with storage run num
execute if data storage koh temp[0] run function dsc:main/koh/pick/shuffle