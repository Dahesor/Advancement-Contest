scoreboard objectives add dlm__ dummy

data modify storage dlm: vld set value {life_types:["indefinite","temp","wait"]}


scoreboard players set #16 dlm__ 16

execute unless score $init dlm__ matches 1 run function dlm:zzz/initialize