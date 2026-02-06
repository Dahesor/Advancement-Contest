data modify entity @s text set from storage gen gen_log
data modify storage gen gen_log_parsed prepend from entity @s text
data modify storage map:main dialog.dialog.body.contents set from storage gen gen_log_parsed
data modify storage run text set value []
data modify storage gen gen_log set from storage run text
kill