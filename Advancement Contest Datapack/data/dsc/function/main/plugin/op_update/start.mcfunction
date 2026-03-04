data modify storage team: misc.op_del set value {id:-1,team:"red"}

execute if data storage team: outpost.red[0] run function dsc:main/plugin/op_update/port/red
execute if data storage team: outpost.green[0] run function dsc:main/plugin/op_update/port/green
execute if data storage team: outpost.blue[0] run function dsc:main/plugin/op_update/port/blue
execute if data storage team: outpost.yellow[0] run function dsc:main/plugin/op_update/port/yellow
execute if data storage team: outpost.light_purple[0] run function dsc:main/plugin/op_update/port/light_purple
execute if data storage team: outpost.white[0] run function dsc:main/plugin/op_update/port/white
execute if data storage team: outpost.gold[0] run function dsc:main/plugin/op_update/port/gold
execute if data storage team: outpost.gray[0] run function dsc:main/plugin/op_update/port/gray