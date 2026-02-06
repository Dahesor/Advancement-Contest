execute if block ~ ~ ~ #map:special/nether_fortress run return run data modify storage map:main ascii set value "Ҿ"

execute if score $__height map matches 2.. run return run data modify storage map:main ascii set value "ü"
execute if score $__height map matches -1..1 run return run data modify storage map:main ascii set value "đ"
data modify storage map:main ascii set value "Ħ"
