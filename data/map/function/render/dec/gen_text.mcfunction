data modify storage map:main t set value {text:"",bold:0b,extra:["",{text:"-",color:"white",font:"dsc:pl/1",hover_event:{action:"show_text",value:{text:"",font:"default",extra:[{translate:""}]}},extra:["n","|"]},{text:"",font:"dsc:pn"}]}
data modify storage map:main t.text set string storage map:main num.shift
data modify storage map:main t.extra[2].text set from storage map:main t.text

data modify storage map:main t.extra[1].hover_event.value.extra[0].translate set from storage map:main dec_temp[0].char
data modify storage map:main t.extra[1].extra[0] set from storage map:main dec_temp[0].char


scoreboard players operation __font map = z map
scoreboard players operation __font map %= #18 calc.DSC


execute if score __font map matches 3..5 run return run data modify storage map:main t.extra[1].font set value "dsc:pl/2"
execute if score __font map matches 6..8 run return run data modify storage map:main t.extra[1].font set value "dsc:pl/3"
execute if score __font map matches 9..11 run return run data modify storage map:main t.extra[1].font set value "dsc:pl/4"
execute if score __font map matches 12..15 run return run data modify storage map:main t.extra[1].font set value "dsc:pl/5"
execute if score __font map matches 16.. run return run data modify storage map:main t.extra[1].font set value "dsc:pl/6"