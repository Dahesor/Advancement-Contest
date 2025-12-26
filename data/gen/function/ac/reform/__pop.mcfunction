$execute positioned ~$(x) ~ ~$(z) run place feature sculk_patch_ancient_city
execute store result score $rand gen run random value 1..100

$execute if score $rand gen matches ..30 run return run execute positioned ~$(x) ~ ~$(z) positioned ~ -27 ~ run function gen:ac/reform/__paint
$execute if score $rand gen matches 31..59 run return run execute positioned ~$(x) ~ ~$(z) positioned ~ -34 ~ run function gen:ac/reform/__paint
$execute if score $rand gen matches 60..80 run return run execute positioned ~$(x) ~ ~$(z) positioned ~ -40 ~ run function gen:ac/reform/__paint