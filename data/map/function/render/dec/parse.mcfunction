#Overworld
data modify storage map:main dec_temp set from storage map:main dec
scoreboard players set __dec_in map 1
execute if data storage map:main dec_temp[0].char run function map:render/dec/element

#Nether
data modify storage map:main dec_temp set from storage map:main dec_nether
scoreboard players set __dec_in map 2
execute if data storage map:main dec_temp[0].char run function map:render/dec/element

#End
data modify storage map:main dec_temp set from storage map:main dec_end
scoreboard players set __dec_in map 3
execute if data storage map:main dec_temp[0].char run function map:render/dec/element