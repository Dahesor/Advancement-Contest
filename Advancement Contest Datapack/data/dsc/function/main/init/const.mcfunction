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
scoreboard players set BASE_RESPAWN_TIME main 1000
scoreboard players set OUTPOST_WAVE_TIME main 800
scoreboard players set INITIAL_BOUNTY main 10
scoreboard players set HILL_DURATION main 6000

data modify storage team: outpost.next_update set value {blue:-1,green:-1,red:-1,yellow:-1,gold:-1,gray:-1,white:-1,light_purple:-1}
function sidebar.dah:visible/show_all_color

scoreboard players set #red team 0
scoreboard players set #green team 0
scoreboard players set #blue team 0
scoreboard players set #yellow team 0
scoreboard players set #light_purple team 0
scoreboard players set #white team 0
scoreboard players set #gold team 0
scoreboard players set #gray team 0