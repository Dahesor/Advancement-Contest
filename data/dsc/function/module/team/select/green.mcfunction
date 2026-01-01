team join green @s
function sidebar.dah:assign/color {color:"green"}
execute at @s run playsound entity.experience_orb.pickup master @s
item replace entity @s armor.head with leather_helmet[unbreakable={},dyed_color=1491200,enchantments={binding_curse:1}]