gamemode spectator @a
execute at 0-0-0-0-0 run tp @a ~ 500 ~
schedule function dsc:main/init/remove_lobby 1t
schedule function dsc:main/init/init 5t