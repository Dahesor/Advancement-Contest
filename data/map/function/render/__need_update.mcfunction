$data modify storage map:main main.data[$(x)][0].update set value true
#$say [$(x)][].update
#execute store result score test map if data storage map:main temp[]
#tellraw @a {score:{name:test,objective:map}}