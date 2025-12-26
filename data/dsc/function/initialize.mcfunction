gamerule limited_crafting true
recipe take @a *
advancement revoke @a everything
scoreboard players set MAP_UPDATE_SPEED calc.DSC 60
forceload add 512 512
setworldspawn 512 100 512
scoreboard players set #init calc.DSC 1

scoreboard players set $enable_adv calc.DSC 0
scoreboard players set $package_amount calc.DSC 0
scoreboard players set $new_score calc.DSC 0

summon marker 512 0 512 {UUID:[I;0,0,0,0]}

#temp
scoreboard players set origin_x map 0
scoreboard players set origin_z map 0
scoreboard players set size map 64

function map:reset_main
function map:render/init

schedule function map:reset_main 3s

team add red
team add blue
team add green
team add yellow
team add pink
team add white
team add orange
team add gray

team modify red color red
team modify blue color aqua
team modify green color green
team modify yellow color yellow
team modify pink color light_purple
team modify white color white
team modify orange color gold
team modify gray color gray

team modify red friendlyFire false
team modify blue friendlyFire false
team modify green friendlyFire false
team modify yellow friendlyFire false
team modify pink friendlyFire false
team modify white friendlyFire false
team modify orange friendlyFire false
team modify gray friendlyFire false

team modify red nametagVisibility hideForOtherTeams
team modify blue nametagVisibility hideForOtherTeams
team modify green nametagVisibility hideForOtherTeams
team modify yellow nametagVisibility hideForOtherTeams
team modify pink nametagVisibility hideForOtherTeams
team modify white nametagVisibility hideForOtherTeams
team modify orange nametagVisibility hideForOtherTeams
team modify gray nametagVisibility hideForOtherTeams

team modify red seeFriendlyInvisibles true
team modify blue seeFriendlyInvisibles true
team modify green seeFriendlyInvisibles true
team modify yellow seeFriendlyInvisibles true
team modify pink seeFriendlyInvisibles true
team modify white seeFriendlyInvisibles true
team modify orange seeFriendlyInvisibles true
team modify gray seeFriendlyInvisibles true

scoreboard players set red score 0
scoreboard players set blue score 0
scoreboard players set green score 0
scoreboard players set yellow score 0
scoreboard players set pink score 0
scoreboard players set white score 0
scoreboard players set orange score 0
scoreboard players set gray score 0