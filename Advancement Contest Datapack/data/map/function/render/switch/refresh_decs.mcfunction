function map:render/dec/parse

function map:render/player/get_all

data modify storage map:main dec_temp set value []
execute if data storage map:main dec_koh.id run data modify storage map:main dec_temp append from storage map:main dec_koh
scoreboard players set __dec_in map 1
execute if data storage map:main dec_temp[0].char run function map:render/dec/element