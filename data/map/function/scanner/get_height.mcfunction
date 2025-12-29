scoreboard players set __last_y map -1000

#storage run index -> {x:0,z:0}
execute store result storage run index.x int 1 run scoreboard players remove __cx map 1
scoreboard players add __cx map 1
execute store result storage run index.z int 1 run scoreboard players get __cz map
function map:scanner/__read_height with storage run index