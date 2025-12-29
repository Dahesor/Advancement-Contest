scoreboard players operation __last_valid map = __valid map
scoreboard players set __valid map 0

data modify storage map:main chunk set value {color:["#FF0000","#FF0000","#FF0000","#FF0000"]}

#storage run index -> {x:0,z:0}
execute store result storage run index.x int 1 run scoreboard players get __cx map
execute store result storage run index.z int 1 run scoreboard players get __cz map
function map:scanner/__insert_data_border with storage run index