tag @s remove outpost_init
kill
execute if entity @s[nbt={data:{outpost:{team:"red"}}}] run loot spawn ~ ~ ~ loot dsc:props/op/red
execute if entity @s[nbt={data:{outpost:{team:"blue"}}}] run loot spawn ~ ~ ~ loot dsc:props/op/blue
execute if entity @s[nbt={data:{outpost:{team:"light_purple"}}}] run loot spawn ~ ~ ~ loot dsc:props/op/light_purple
execute if entity @s[nbt={data:{outpost:{team:"yellow"}}}] run loot spawn ~ ~ ~ loot dsc:props/op/yellow
execute if entity @s[nbt={data:{outpost:{team:"gray"}}}] run loot spawn ~ ~ ~ loot dsc:props/op/gray
execute if entity @s[nbt={data:{outpost:{team:"white"}}}] run loot spawn ~ ~ ~ loot dsc:props/op/white
execute if entity @s[nbt={data:{outpost:{team:"gold"}}}] run loot spawn ~ ~ ~ loot dsc:props/op/gold
execute if entity @s[nbt={data:{outpost:{team:"green"}}}] run loot spawn ~ ~ ~ loot dsc:props/op/green

execute if score #reason outpost matches 0 run summon item ~ ~ ~ {Age:5980s,PickupDelay:32767s,Invulnerable:1b,Item:{id:"barrier",components:{item_model:"dsc:null"}},CustomName:{text:"位置不合法!",color:"red"},CustomNameVisible:1b,Motion:[0d,0.2d,0d]}
execute if score #reason outpost matches 1 run summon item ~ ~0.5 ~ {Age:5980s,PickupDelay:32767s,Invulnerable:1b,Item:{id:"barrier",components:{item_model:"dsc:null"}},CustomName:{text:"已达团队上限!",color:"red"},CustomNameVisible:1b,Motion:[0d,0.2d,0d]}