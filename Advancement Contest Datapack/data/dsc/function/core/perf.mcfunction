#$(run)

stopwatch remove dsc:core/perf
stopwatch create dsc:core/perf
$$(run)
execute store result score #%%CORE_PERF calc.DSC run stopwatch query dsc:core/perf 1000
stopwatch remove dsc:core/perf
$tellraw @a[tag=dev] ["",{"text":"[Perf] ","color":"yellow"},{"text":"Timed: ","color":"white",hover_event:{action:"show_text",value:"$(run)"}},{"score":{"name":"#%%CORE_PERF","objective":"calc.DSC"},"color":"green"},{"text":" ms","color":"white"}]

