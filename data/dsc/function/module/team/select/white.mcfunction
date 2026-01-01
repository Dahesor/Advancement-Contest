team join white @s
function sidebar.dah:assign/color {color:"white"}
execute at @s run playsound entity.experience_orb.pickup master @s
item replace entity @s armor.head with leather_helmet[unbreakable={},dyed_color=16777215,enchantments={binding_curse:1}]