execute unless data storage dlm: ticket.life run return run data modify storage dlm: ticket.life set value {type:"indefinite"}
execute if data storage dlm: ticket.life{type:"temp"} run return 1
execute if data storage dlm: ticket.life{type:"indefinite"} run return 1
execute if data storage dlm: ticket.life{type:"wait"} if data storage dlm: ticket.life.time run return 1

return fail