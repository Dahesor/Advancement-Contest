scoreboard players set distance gen 0
scoreboard players set success gen 0

stopwatch create gen:aux

$tellraw @a [{text:"\n[gen:locator] 正在定位~($(x),$(z))^$(step)最近的$(type): $(id) in $(in)",color:"dark_gray",click_event:{action:"suggest_command",command:"/execute in $(in) facing ~$(x) ~ ~$(z) rotated ~ 0 positioned ~$(x) ~ ~$(z) positioned ^ ^ ^$(step) run tp ~ ~ ~"}}]

$setblock ~ ~ ~ command_block{Command:"execute in $(in) facing ~$(x) ~ ~$(z) rotated ~ 0 positioned ~$(x) ~ ~$(z) positioned ^ ^ ^$(step) store result score distance gen store success score success gen run locate $(type) $(id)",TrackOutput:true,auto:true} replace

return 1
schedule function gen:locate/core/read 2t