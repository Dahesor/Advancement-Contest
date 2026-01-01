scoreboard players set on main 1
scoreboard players set stage main 1
scoreboard players set nether_open main 1
scoreboard players set end_open main 1
scoreboard players set end_event_open main 1
scoreboard players set invincible main 1
scoreboard players set drop_rate main 30
scoreboard players set elimination main 0
scoreboard players set enable_adv main 1
scoreboard players operation STAGE_2_START_TIME main = LENGTH_SECTOIN_1 main
scoreboard players operation STAGE_3_START_TIME main = LENGTH_SECTOIN_1 main
scoreboard players operation STAGE_3_START_TIME main += LENGTH_SECTOIN_2 main
scoreboard players operation END_EVENT_CLOSE_TIME main = STAGE_3_START_TIME main
scoreboard players remove END_EVENT_CLOSE_TIME main 18000
scoreboard players operation END_CLOSE_TIME main = STAGE_3_START_TIME main
scoreboard players remove END_CLOSE_TIME main 12000
scoreboard players set INVINCIBLE_TIME main 6000
scoreboard players set ACE_RESPAWN_TIME main 1800

function sidebar.dah:visible/show_all_color
execute as @a[scores={team=1..}] run function dsc_recipe:initial/give