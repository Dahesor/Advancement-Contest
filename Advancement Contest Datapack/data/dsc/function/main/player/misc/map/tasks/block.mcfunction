return 1
setblock ~ ~-10 ~ crafter[crafting=true,orientation=up_east,triggered=false]{Items:[{id:"redstone_block"}],triggered:false,crafting_ticks_remaining:0} strict
setblock ~ ~-10 ~1 redstone_block

scoreboard players set test main 0
schedule function dsc:main/player/misc/map/tasks/test 1t

setblock ~ ~ ~ chest{}
setblock ~ ~ ~ crafter{}

function dsc:main/player/misc/map/tasks/block