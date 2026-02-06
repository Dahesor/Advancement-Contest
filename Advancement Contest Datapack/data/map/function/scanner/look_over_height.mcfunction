scoreboard players set __next_y map -999

#storage run index -> {x:0,z:0}
execute store result storage run index.x int 1 run scoreboard players add __cx map 1
scoreboard players remove __cx map 1
execute store result storage run index.z int 1 run scoreboard players get __cz map
function map:scanner/__read_height_over with storage run index