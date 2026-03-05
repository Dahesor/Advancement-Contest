execute unless data storage run k[0] run return fail
data modify storage run s.s set from storage run k[0]
function registry:validation/proc/__make_recipe_icon with storage run s
data remove storage run k[0]
function registry:validation/proc/make_recipe_icon