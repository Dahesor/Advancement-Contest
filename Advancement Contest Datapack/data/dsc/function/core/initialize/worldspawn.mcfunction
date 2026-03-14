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
data modify storage dlm: ticket set value {id:"dsc:lobby",life:{type:"indefinite"},pos:[-22,-22],to:[22,22],dimension:"gen:lobby",on_load:"function dsc:core/initialize/place_lobby"}
function dlm:new_ticket

data modify storage dlm: ticket set value {id:"dsc:root",life:{type:"indefinite"}}
function dlm:new_ticket

execute if score #FLAG_NO_GEN main matches 1 run return run schedule function gen:finish 2s
schedule clear gen:finish
schedule function gen:entry 2s
