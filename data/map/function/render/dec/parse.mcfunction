data modify storage map:main dec_temp set from storage map:main dec
execute if data storage map:main dec[0].char run function map:render/dec/element
data modify storage map:main dec set from storage map:main dec_temp
data remove storage map:main dec_temp