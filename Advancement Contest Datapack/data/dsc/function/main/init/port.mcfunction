scoreboard players set prepared main 0
gamemode spectator @a
execute at 0-0-0-0-9 run tp @a ~ 500 ~
gamerule block_drops false
gamerule max_block_modifications 80000
schedule function dsc:main/init/remove_lobby 1t
schedule function dsc:main/init/init 5t