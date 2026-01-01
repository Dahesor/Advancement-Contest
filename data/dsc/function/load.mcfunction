scoreboard objectives add calc.DSC dummy
scoreboard objectives add map dummy
scoreboard objectives add op.auth dummy
scoreboard objectives add dialog trigger
scoreboard objectives add input trigger
scoreboard objectives add screen dummy
scoreboard objectives add md.dimension dummy
scoreboard objectives add team dummy
scoreboard objectives add score dummy
scoreboard objectives add gen dummy
scoreboard objectives add trigger.balanced_diet dummy
scoreboard objectives add trigger.kill_all_mobs dummy
scoreboard objectives add trigger.biomes dummy
scoreboard objectives add trigger.pairs dummy
scoreboard objectives add trigger.tame_cats dummy
scoreboard objectives add trigger.tame_dogs dummy
scoreboard objectives add refreshCD dummy
scoreboard objectives add health health
scoreboard objectives add outpost dummy
scoreboard objectives add outpost.state dummy
scoreboard objectives add main dummy
scoreboard objectives add used.ender_eye used:ender_eye
scoreboard objectives add death deathCount
scoreboard objectives add revive_time dummy
scoreboard objectives add leave_game custom:leave_game
stopwatch create dsc:master


gamerule max_command_sequence_length 655360
gamerule max_command_forks 655360
gamerule immediate_respawn true
gamerule keep_inventory true
gamerule limited_crafting true

#NUM
scoreboard players set #-1 calc.DSC -1
scoreboard players set #2 calc.DSC 2
scoreboard players set #3 calc.DSC 3
scoreboard players set #4 calc.DSC 4
scoreboard players set #6 calc.DSC 6
scoreboard players set #8 calc.DSC 8
scoreboard players set #10 calc.DSC 10
scoreboard players set #16 calc.DSC 16
scoreboard players set #18 calc.DSC 18
scoreboard players set #20 calc.DSC 20
scoreboard players set #22 calc.DSC 22
scoreboard players set #32 calc.DSC 32
scoreboard players set #48 calc.DSC 48
scoreboard players set #60 calc.DSC 60
scoreboard players set #100 calc.DSC 100
scoreboard players set #200 calc.DSC 200
scoreboard players set #341 calc.DSC 341
scoreboard players set #360 calc.DSC 360
scoreboard players set #384 calc.DSC 384
scoreboard players set #1000 calc.DSC 1000
scoreboard players set #1024 calc.DSC 1024
scoreboard players set #2667 calc.DSC 2667

execute unless score #init calc.DSC matches 1 run function dsc:initialize