#$(x) $(z)

$execute in $(in) positioned $(x) ~ $(z) run tp @s ~ ~ ~
execute unless score @s md.dimension matches 2 at @s positioned over world_surface run tp @s ~ ~ ~
execute at @s positioned ~-32 0 ~-32 run tp @s @a[limit=1,sort=nearest,dx=64,dy=200,dz=64,gamemode=!spectator]