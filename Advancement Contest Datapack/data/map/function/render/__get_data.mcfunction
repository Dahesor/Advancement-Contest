$execute unless score now_drawing map matches 1.. run data modify storage map:main temp append from storage map:main overworld.data[$(x)]
$execute if score now_drawing map matches 1 run data modify storage map:main temp append from storage map:main the_nether.data[$(x)]
$execute if score now_drawing map matches 2 run data modify storage map:main temp append from storage map:main the_end.data[$(x)]