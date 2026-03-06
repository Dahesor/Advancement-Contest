$data modify storage dsc:task this set from storage dsc:task entry[{advancement:"$(id)"}]

execute if data storage dsc:task this{linked:true} run return fail

$data modify storage dsc:task entry[{advancement:"$(id)"}].linked set value true
$data modify storage dsc:task new append from storage dsc:task entry[{advancement:"$(id)"}]

data modify storage dsc:task proc_list append from storage dsc:task this.node.children[]