#tellraw @a [{score:{name:"__cx",objective:"map"}},", ",{score:{name:"Chunk_x_min",objective:"main"}}]
return fail
execute unless score on main matches 1 run return fail
execute if score __cx map < Border_x_min main run return run scoreboard players set __in_world map 0
execute if score __cx map > Border_x_max main run return run scoreboard players set __in_world map 0
execute if score __cz map < Border_z_min main run return run scoreboard players set __in_world map 0
execute if score __cz map > Border_z_max main run return run scoreboard players set __in_world map 0