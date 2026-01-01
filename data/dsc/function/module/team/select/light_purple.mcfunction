team join light_purple @s
function sidebar.dah:assign/color {color:"light_purple"}
execute at @s run playsound entity.experience_orb.pickup master @s
item replace entity @s armor.head with leather_helmet[unbreakable={},dyed_color=13303991,enchantments={binding_curse:1}]