execute positioned over ocean_floor as 0-0-0-0-0 run function map:sample/ascii/get_ocen_floor
execute if score $__height map matches ..3 run return run data modify storage map:main ascii set value "è"
execute if score $__height map matches 4..6 run return run data modify storage map:main ascii set value "á"
data modify storage map:main ascii set value "×"
