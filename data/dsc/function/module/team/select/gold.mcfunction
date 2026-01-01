team join gold @s
function sidebar.dah:assign/color {color:"gold"}
execute at @s run playsound entity.experience_orb.pickup master @s
item replace entity @s armor.head with leather_helmet[unbreakable={},dyed_color=16748303,enchantments={binding_curse:1}]