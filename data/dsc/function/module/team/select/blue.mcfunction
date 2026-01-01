team join blue @s
function sidebar.dah:assign/color {color:"blue"}
execute at @s run playsound entity.experience_orb.pickup master @s
item replace entity @s armor.head with leather_helmet[unbreakable={},dyed_color=987135,enchantments={binding_curse:1}]