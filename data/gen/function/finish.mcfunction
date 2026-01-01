function gen:reset
tellraw @a [{text:"[gen:main] 执行成功",color:"green"},{score:{name:"total_time",objective:"gen"},color:"green"},{text:"s",color:"green"}]
scoreboard players set gen main 0
schedule function dsc:core/initialize/finished 2s