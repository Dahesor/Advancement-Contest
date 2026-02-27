execute unless data storage dlm: timed_tickets[0] run return fail
execute store result score #this dlm__ run data get storage dlm: timed_tickets[0].until
execute unless score $time dlm__ >= #this dlm__ run return fail

function dlm:close_ticket with storage dlm: timed_tickets[0]

execute store result score next_event dlm__ run data get storage dlm: timed_tickets[0].until
execute if data storage dlm: timed_tickets[0] run return run function dlm:zzz/timed/act

scoreboard players set next_event dlm__ -1