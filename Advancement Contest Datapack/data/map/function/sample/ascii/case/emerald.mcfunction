execute if score $__height map matches 2.. run return run data modify storage map:main ascii set value "Ä"
execute if score $__height map matches -1..1 run return run data modify storage map:main ascii set value "Å"
data modify storage map:main ascii set value "Æ"
