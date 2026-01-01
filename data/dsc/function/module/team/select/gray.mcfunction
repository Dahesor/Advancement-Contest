team join gray @s
function sidebar.dah:assign/color {color:"gray"}
execute at @s run playsound entity.experience_orb.pickup master @s
item replace entity @s armor.head with leather_helmet[unbreakable={},dyed_color=10132122,enchantments={binding_curse:1}]