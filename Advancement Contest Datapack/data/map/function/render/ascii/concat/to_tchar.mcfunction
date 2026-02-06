execute unless data storage map:main chars[15] run return fail
data modify storage map:main concat.c1 set from storage map:main chars[0]
data modify storage map:main concat.c2 set from storage map:main chars[1]
data modify storage map:main concat.c3 set from storage map:main chars[4]
data modify storage map:main concat.c4 set from storage map:main chars[5]
data modify storage map:main concat.c5 set from storage map:main chars[8]
data modify storage map:main concat.c6 set from storage map:main chars[9]
data modify storage map:main concat.c7 set from storage map:main chars[12]
data modify storage map:main concat.c8 set from storage map:main chars[13]
function map:render/ascii/concat/__char_8 with storage map:main concat
data modify storage map:main tchars append from storage map:main concat.res



data modify storage map:main concat.c1 set from storage map:main chars[2]
data modify storage map:main concat.c2 set from storage map:main chars[3]
data modify storage map:main concat.c3 set from storage map:main chars[6]
data modify storage map:main concat.c4 set from storage map:main chars[7]
data modify storage map:main concat.c5 set from storage map:main chars[10]
data modify storage map:main concat.c6 set from storage map:main chars[11]
data modify storage map:main concat.c7 set from storage map:main chars[14]
data modify storage map:main concat.c8 set from storage map:main chars[15]
function map:render/ascii/concat/__char_8 with storage map:main concat
data modify storage map:main tchars append from storage map:main concat.res

data remove storage map:main chars[0]
data remove storage map:main chars[0]
data remove storage map:main chars[0]
data remove storage map:main chars[0]
data remove storage map:main chars[0]
data remove storage map:main chars[0]
data remove storage map:main chars[0]
data remove storage map:main chars[0]
data remove storage map:main chars[0]
data remove storage map:main chars[0]
data remove storage map:main chars[0]
data remove storage map:main chars[0]
data remove storage map:main chars[0]
data remove storage map:main chars[0]
data remove storage map:main chars[0]
data remove storage map:main chars[0]


function map:render/ascii/concat/to_tchar