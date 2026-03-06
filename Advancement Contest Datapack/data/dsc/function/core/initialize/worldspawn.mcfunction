setworldspawn ~ 300 ~
worldborder center ~ ~
summon marker ~ 300 ~ {UUID:[I;0,0,0,0],CustomName:"ROOT"}
summon marker ~ 300 ~ {UUID:[I;0,0,0,9],CustomName:"HOME"}
defaultgamemode adventure
function map:render/init
function map:init/nether

scoreboard players set SHADER_TYPE map 1
tp @a ~ ~ ~

schedule function map:reset_main 1s
data modify storage dlm: ticket set value {id:"dsc:lobby",life:{type:"indefinite"}}
execute positioned ~-20 ~ ~-20 summon marker run function dsc:core/initialize/get_corner
function dlm:new_ticket

data modify storage dlm: ticket set value {id:"dsc:root",life:{type:"indefinite"}}
function dlm:new_ticket

return run schedule function gen:finish 2s
schedule clear gen:finish
schedule function gen:entry 2s
