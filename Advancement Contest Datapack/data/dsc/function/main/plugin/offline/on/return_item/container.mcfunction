#run num -> {i:0}
execute store result storage run num.i int 1 run data get storage temp Inv[0].Slot
data remove storage temp Inv[0].Slot
data modify entity 0-0-0-0-2 item set from storage temp Inv[0]
function dsc:main/plugin/offline/on/return_item/__item_item with storage run num


data remove storage temp Inv[0]
execute if data storage temp Inv[0] run function dsc:main/plugin/offline/on/return_item/container