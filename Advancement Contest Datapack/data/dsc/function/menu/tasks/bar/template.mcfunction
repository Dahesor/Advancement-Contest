data modify storage main: bossbar set value [{text:"\uE773",font:"dsc:bitmap/line_1"},\
\
    [{text:"\u200c",extra:["\uEAAA","\uE772",{translate:"??",shadow_color:0,font:"dsc:tasks/icon"},"\u200c"]},\
    {translate:"##pwidth",color:"aqua"},\
    "\uE778",\
    {translate:"##pwidth",font:"dsc:bitmap/line_2",shadow_color:0},\
    "\uE778",\
    {translate:"##pwidth",font:"dsc:bitmap/line_3",shadow_color:0},"\uE775\uE775"],\
]


data modify storage main: bossbar append from storage main: bossbar[1]
data modify storage main: bossbar append from storage main: bossbar[1]
data modify storage main: bossbar append from storage main: bossbar[1]
data modify storage main: bossbar append value "\uE775\uE775\uE775\uE775"
data modify storage main: bossbar append value "\uE773"