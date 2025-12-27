gamerule limited_crafting true
recipe take @a *
advancement revoke @a everything
scoreboard players set MAP_UPDATE_SPEED calc.DSC 60
forceload add 512 512
setworldspawn 512 100 512
scoreboard players set #init calc.DSC 1

scoreboard players set LENGTH_SECTOIN_1 main 54000
scoreboard players set LENGTH_SECTOIN_2 main 36000
scoreboard players set LENGTH_SECTOIN_3 main 36000
scoreboard players set $enable_adv calc.DSC 0
scoreboard players set $package_amount calc.DSC 0
scoreboard players set $new_score calc.DSC 0

summon marker 512 0 512 {UUID:[I;0,0,0,0],CustomName:"ROOT"}

#temp
scoreboard players set origin_x map 0
scoreboard players set origin_z map 0
scoreboard players set size map 64

scoreboard players operation nether_x map = origin_x map
scoreboard players operation nether_z map = origin_z map
scoreboard players add nether_x map 512
scoreboard players add nether_z map 512
scoreboard players operation nether_x map /= #8 calc.DSC
scoreboard players operation nether_z map /= #8 calc.DSC
scoreboard players remove nether_x map 512
scoreboard players remove nether_z map 512

function map:reset_main
function map:render/init
function map:init/nether

schedule function map:reset_main 3s

team add red
team add blue
team add green
team add yellow
team add light_purple
team add white
team add gold
team add gray

team modify red color red
team modify blue color aqua
team modify green color green
team modify yellow color yellow
team modify light_purple color light_purple
team modify white color white
team modify gold color gold
team modify gray color gray

team modify red friendlyFire false
team modify blue friendlyFire false
team modify green friendlyFire false
team modify yellow friendlyFire false
team modify light_purple friendlyFire false
team modify white friendlyFire false
team modify gold friendlyFire false
team modify gray friendlyFire false

team modify red nametagVisibility hideForOtherTeams
team modify blue nametagVisibility hideForOtherTeams
team modify green nametagVisibility hideForOtherTeams
team modify yellow nametagVisibility hideForOtherTeams
team modify light_purple nametagVisibility hideForOtherTeams
team modify white nametagVisibility hideForOtherTeams
team modify gold nametagVisibility hideForOtherTeams
team modify gray nametagVisibility hideForOtherTeams

team modify red seeFriendlyInvisibles true
team modify blue seeFriendlyInvisibles true
team modify green seeFriendlyInvisibles true
team modify yellow seeFriendlyInvisibles true
team modify light_purple seeFriendlyInvisibles true
team modify white seeFriendlyInvisibles true
team modify gold seeFriendlyInvisibles true
team modify gray seeFriendlyInvisibles true

scoreboard players set red score 0
scoreboard players set blue score 0
scoreboard players set green score 0
scoreboard players set yellow score 0
scoreboard players set pink score 0
scoreboard players set white score 0
scoreboard players set orange score 0
scoreboard players set gray score 0