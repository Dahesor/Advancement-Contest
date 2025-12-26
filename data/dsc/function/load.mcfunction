scoreboard objectives add calc.DSC dummy
scoreboard objectives add map dummy
scoreboard objectives add op.auth dummy
scoreboard objectives add dialog trigger
scoreboard objectives add input trigger
scoreboard objectives add screen dummy
scoreboard objectives add team dummy
scoreboard objectives add score dummy
scoreboard objectives add gen dummy
scoreboard objectives add trigger.balanced_diet dummy
stopwatch create dsc:master
execute unless score #init calc.DSC matches 1 run function dsc:initialize


gamerule max_command_sequence_length 655360
gamerule max_command_forks 655360

#NUM
scoreboard players set #-1 calc.DSC -1
scoreboard players set #2 calc.DSC 2
scoreboard players set #4 calc.DSC 4
scoreboard players set #6 calc.DSC 6
scoreboard players set #10 calc.DSC 10
scoreboard players set #16 calc.DSC 16
scoreboard players set #18 calc.DSC 18
scoreboard players set #20 calc.DSC 20
scoreboard players set #22 calc.DSC 22
scoreboard players set #32 calc.DSC 32
scoreboard players set #48 calc.DSC 48
scoreboard players set #100 calc.DSC 100
scoreboard players set #200 calc.DSC 200
scoreboard players set #341 calc.DSC 341
scoreboard players set #360 calc.DSC 360
scoreboard players set #384 calc.DSC 384
scoreboard players set #2667 calc.DSC 2667
scoreboard players set #1000 calc.DSC 1000