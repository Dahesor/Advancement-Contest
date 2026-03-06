function dsc:player/uid/get
data modify storage main: online append value {}
data modify storage main: online[-1].UID set from storage main: player[0].UID
data modify storage main: online[-1].Name set from storage main: player[0].Name
data modify storage main: online[-1].UUID set from storage main: player[0].UUID
scoreboard players add starting_player_count main 1

loot give @s loot dsc:package/init_props
loot give @s loot dsc:package/initial
loot give @s loot dsc:props/op
item replace entity @s saddle with structure_void[custom_data={is_identifier:true},equippable={slot:"saddle",allowed_entities:["player"],can_be_sheared:false,equip_sound:"intentionally_empty",swappable:false},enchantments={"registry:identifier":1}]
scoreboard players operation @s player_bounty = INITIAL_BOUNTY main
function dsc:main/player/hurt/bounty/update
give @s bundle


# ============= Return Fail Below =========
return fail