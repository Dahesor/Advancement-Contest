scoreboard players set #has_load dlm__ 1
data modify storage dlm: validations append value {on_pass:[],tests:[],temp:false}
data modify storage dlm: validations[-1].from_ticket set from storage dlm: n_t.id
data modify storage dlm: validations[-1].on_pass set from storage dlm: n_t.on_load
execute if data storage dlm: n_t.life{type:"temp"} run data modify storage dlm: validations[-1].temp set value true