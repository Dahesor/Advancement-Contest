forceload add ~ ~
setworldspawn ~ 300 ~
worldborder center ~ ~
summon marker ~ 300 ~ {UUID:[I;0,0,0,0],CustomName:"ROOT"}
defaultgamemode adventure
function map:render/init
function map:init/nether

schedule function map:reset_main 1s
tp @a ~ ~ ~

schedule function gen:entry 2s
forceload add ~-20 ~-20 ~20 ~20