execute unless data storage main: p_tracks[0] run return fail

execute unless function dsc:menu/tasks/bar/render/read_package run return 1
function dsc:menu/tasks/bar/_entry

data modify storage main: ebt[0].extra[2].translate set from storage main: track.icon
data modify storage main: ebt[1].translate set string storage main: track.title 1
execute unless entity @s[tag=hide_task_lore] run data modify storage main: ebt[3].translate set string storage main: track.lore[0] 2
execute unless entity @s[tag=hide_task_lore] run data modify storage main: ebt[5].translate set string storage main: track.lore[1] 2

#Recipe Icons
execute if data storage main: track{completed:1b} run data modify storage main: ebt[0].extra insert -2 from storage main: track.recipe_icon.all
execute unless data storage main: track{completed:1b} run data modify storage main: ebt[0].extra insert -2 from storage main: track.recipe_icon.first
#Background
    execute unless score #always_long calc.DSC matches 1 unless entity @s[tag=hide_task_lore] if data storage main: track.lore[1] run data modify storage main: ebt[0].extra[0].text set value "\uEAAB"
    execute unless score #always_long calc.DSC matches 1 if entity @s[tag=hide_task_lore] run data modify storage main: ebt[0].extra[0].text set value "\uEAAE"
    execute if score #always_long calc.DSC matches 1 run data modify storage main: ebt[0].extra[0].text set value "\uEAAB"
#Title Color
    execute if data storage main: track{completed:1b} run data modify storage main: ebt[1].color set value "white"
    execute if data storage main: track{node:"challenge"} run data modify storage main: ebt[1].color set value "dark_purple"
    execute if data storage main: track.pin run data modify storage main: ebt[1].color set value "yellow"
    execute if data storage main: track{node:"challenge"} if data storage main: track.pin run data modify storage main: ebt[1].color set value "light_purple"
#Hover Event
    execute if data storage main: track{completed:false} run data modify storage main: ebt[0].extra[0].hover_event.value prepend from storage main: track.reward.first
    execute unless data storage main: track{completed:false} run data modify storage main: ebt[0].extra[0].hover_event.value prepend from storage main: track.reward.all
    execute if data storage main: track.pin run data modify storage main: ebt[0].extra[0].hover_event.value append value ["\n\n",{translate:"track_list.unpin",color:"gray"}]
    execute unless data storage main: track.pin run data modify storage main: ebt[0].extra[0].hover_event.value append value ["\n\n",{translate:"track_list.pin",color:"yellow"}]

data modify storage main: bossbar append from storage main: ebt

scoreboard players remove #e_allow calc.DSC 1
execute if score #e_allow calc.DSC matches 1.. run function dsc:menu/tasks/bar/render/insert_text