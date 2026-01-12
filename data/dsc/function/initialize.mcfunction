function sidebar.dah:reload
gamerule spawn_wandering_traders false
recipe take @a *
advancement revoke @a everything
scoreboard players set MAP_UPDATE_SPEED calc.DSC 60

scoreboard players set #init calc.DSC 1

scoreboard players set LENGTH_SECTOIN_1 main 54000
scoreboard players set LENGTH_SECTOIN_2 main 36000
scoreboard players set LENGTH_SECTOIN_3 main 36000
scoreboard players set enable_adv main 0
scoreboard players set $package_amount calc.DSC 0
scoreboard players set $new_score calc.DSC 0

scoreboard players set #read_height main 1


team add red
team add blue
team add green
team add yellow
team add light_purple
team add white
team add gold
team add gray

team modify red color red
team modify blue color blue
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
scoreboard players set green score 0
scoreboard players set blue score 0
scoreboard players set yellow score 0
scoreboard players set light_purple score 0
scoreboard players set white score 0
scoreboard players set gold score 0
scoreboard players set gray score 0

data modify storage temp time_text set value [{text:"",shadow_color:-16579829},{text:":"},{text:""},{text:""},{text:" "}]
data modify storage temp time_holder set value -1

gamemode creative @a
dialog show @a {type:"notice",title:"准备你的游戏",body:[{type:"plain_message",contents:{text:"先不要让玩家进入你的服务器！",color:"red"}},{type:"plain_message",contents:[{text:"关闭本页面后，请管理员按"},{keybind:"key.quickActions"},"键，然后打开管理员面板。根据其指示选择游戏的区域。在那之后，游戏将会需要三分钟左右的时间来准备。准备完成后，再让玩家进入服务器"]}]}