scoreboard players operation $this dialog = @s dialog
scoreboard players set @s dialog 0

execute if score $this dialog matches -999 run return run dialog clear @s
execute if score $this dialog matches -98 run function dsc:menu/map/refresh
execute if score $this dialog matches -99 run function dsc:menu/map/auto
execute if score $this dialog matches -100 run function dsc:menu/map/close
execute if score $this dialog matches -101 run function dsc:menu/map/overworld
execute if score $this dialog matches -102 run function dsc:menu/map/nether
execute if score $this dialog matches -103 run function dsc:menu/map/the_end
execute if score $this dialog matches -1 unless score gen main matches 1 run function dsc:menu/admin/guard
execute if score $this dialog matches 1001 unless score centered main matches 1 if function dsc:core/auth/check run function dsc:menu/admin/add_dev

execute if score $this dialog matches 2 run return run function dsc:menu/map/request
execute if score $this dialog matches 10 run return run function dsc:main/player/death/redeploy/check