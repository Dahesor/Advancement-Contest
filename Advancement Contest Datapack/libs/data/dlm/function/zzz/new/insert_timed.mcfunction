scoreboard players set #i dlm__ 0
data modify storage dlm: tt set from storage dlm: timed_tickets
execute store result score #length dlm__ run data get storage dlm: tt
execute if score #length dlm__ matches 0 run data modify storage dlm: timed_tickets append from storage dlm: this_ticket
execute if score #length dlm__ matches 0 run return run scoreboard players operation next_event dlm__ = #until dlm__

function dlm:zzz/new/check_timed
execute store result score next_event dlm__ run data get storage dlm: timed_tickets[0].until