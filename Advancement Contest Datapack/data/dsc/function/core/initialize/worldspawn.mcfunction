forceload add ~ ~
setworldspawn ~ 300 ~
worldborder center ~ ~
summon marker ~ 300 ~ {UUID:[I;0,0,0,0],CustomName:"ROOT"}
summon marker ~ 300 ~ {UUID:[I;0,0,0,9],CustomName:"HOME"}
defaultgamemode adventure
function map:render/init
function map:init/nether

scoreboard players set SHADER_TYPE map 1
tp @a ~ ~ ~
forceload add ~-20 ~-20 ~20 ~20

schedule function map:reset_main 1s

#return run schedule function gen:finish 2s
schedule clear gen:finish
schedule function gen:entry 2s