data modify storage temp dialog.body append value {type:"item",item:{id:"beacon",components:{item_model:"dsc:outpost/mod","minecraft:custom_model_data":{strings:[]}}},show_tooltip:false,show_decorations:false,description:{contents:"",width:300}}
data modify storage temp dialog.body[-1].item.components."minecraft:custom_model_data".strings append from storage team: misc.color

function dsc:main/player/death/menu/__insert_trigger with storage team: outpost.this[0]

data remove storage team: outpost.this[0]
execute if data storage team: outpost.this[0] run function dsc:main/player/death/menu/each