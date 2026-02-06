scoreboard players set next gen 100
scoreboard players set phase gen 300

data modify storage gen gen_log prepend value [{text:"\n[gen:main] 要塞放置失败。强制放置传送门房间",color:"red"}]
tp @a ~ ~ ~
schedule function gen:stronghold/force_place 8s replace

