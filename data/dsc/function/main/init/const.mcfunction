scoreboard players operation STAGE_2_START_TIME main = LENGTH_SECTOIN_1 main
scoreboard players operation STAGE_3_START_TIME main = LENGTH_SECTOIN_1 main
scoreboard players operation STAGE_3_START_TIME main += LENGTH_SECTOIN_2 main
scoreboard players operation END_EVENT_CLOSE_TIME main = STAGE_3_START_TIME main
scoreboard players remove END_EVENT_CLOSE_TIME main 18000
scoreboard players operation END_CLOSE_TIME main = STAGE_3_START_TIME main
scoreboard players remove END_CLOSE_TIME main 12000
scoreboard players operation NETHER_SHRINK_DURATION main = LENGTH_SECTOIN_3 main
scoreboard players operation NETHER_SHRINK_DURATION main /= #2 calc.DSC

scoreboard players set end_open main 0