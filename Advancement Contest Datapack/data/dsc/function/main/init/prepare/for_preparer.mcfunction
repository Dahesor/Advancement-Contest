item replace entity @s weapon.offhand with air
execute if items entity @s container.* filled_map run return run function dsc:main/init/prepare/ready
item replace entity @s player.cursor with air

execute store result score #temp calc.DSC run clear @s map[custom_data~{__prepare_item:true}] 0
execute if score #temp calc.DSC matches 9 run return 1

item replace entity @s hotbar.0 with map[item_model="dsc:system/prepare_diamond",item_name="右键准备",custom_data={__prepare_item:true}]
item replace entity @s hotbar.1 from entity @s hotbar.0
item replace entity @s hotbar.2 from entity @s hotbar.1
item replace entity @s hotbar.3 from entity @s hotbar.2
item replace entity @s hotbar.4 from entity @s hotbar.3
item replace entity @s hotbar.5 from entity @s hotbar.4
item replace entity @s hotbar.6 from entity @s hotbar.5
item replace entity @s hotbar.7 from entity @s hotbar.6
item replace entity @s hotbar.8 from entity @s hotbar.7