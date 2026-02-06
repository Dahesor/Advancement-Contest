dialog clear @a
schedule clear gen:main
execute store result score total_time gen run stopwatch query gen:main
stopwatch remove gen:main
stopwatch remove gen:validate
gamerule command_block_output false
gamerule block_drops true
gamerule entity_drops true
gamemode creative @a
execute unless score spec_gen_chunk gen matches 1 run gamerule spectators_generate_chunks false