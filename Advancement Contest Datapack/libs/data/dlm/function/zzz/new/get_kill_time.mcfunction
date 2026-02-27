scoreboard players operation #until dlm__ = $time dlm__
execute store result score #life dlm__ run data get storage dlm: n_t.life.time
execute store result storage dlm: this_ticket.until int 1 run scoreboard players operation #until dlm__ += #life dlm__