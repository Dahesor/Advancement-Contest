schedule clear gen:main
tellraw @a [{text:"[gen:main] 进程终止: ERR",color:"red"}]
gamerule command_block_output false
gamerule block_drops true
gamerule entity_drops true
gamemode creative @a
execute unless score spec_gen_chunk gen matches 1 run gamerule spectators_generate_chunks false