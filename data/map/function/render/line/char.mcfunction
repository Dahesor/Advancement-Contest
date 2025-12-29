execute unless data storage map:main line[0].color[3] run return run function map:render/line/empty

function map:render/line/char/1
function map:render/line/char/1
function map:render/line/char/2
function map:render/line/char/2

scoreboard players add __char_count map 1
data remove storage map:main line[0]
execute if score __char_count map matches ..63 run function map:render/line/char