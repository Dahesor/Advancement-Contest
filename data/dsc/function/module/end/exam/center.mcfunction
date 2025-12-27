fill ~1 ~ ~1 ~-1 ~ ~-1 end_portal replace
execute summon marker run function dsc:module/end/exam/record
playsound block.end_portal.spawn master @a ~ ~ ~ 1 1 1
scoreboard players set end_open main 1