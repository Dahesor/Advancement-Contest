tag @a[team=gold] add sidebar_player
data modify storage team: outpost.this set from storage team: outpost.gold
scoreboard players operation $this team = @s team
execute unless entity @s[tag=aced] run function dsc:module/sidebar/ace/ask
scoreboard players operation $this score = gold score
function dsc:module/sidebar/this/page
function sidebar.dah:modify/this
tag @a remove sidebar_player