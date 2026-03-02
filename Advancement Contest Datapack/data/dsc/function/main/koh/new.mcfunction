scoreboard players set $koh_loaded main 0
function dsc:main/koh/new/__summon with storage koh locations[0]
scoreboard players operation hill_time main = HILL_DURATION main
scoreboard players set koh_winning main 0
function dsc:main/announce/new_hill