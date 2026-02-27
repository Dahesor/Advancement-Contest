data modify storage dlm: ticket set value {id:"test1",pos:{x:1000,z:1000},life:{type:"wait",time:1000}}
function dlm:new_ticket

data modify storage dlm: ticket set value {id:"test2",pos:{x:1000,z:1101},life:{type:"wait",time:500}}
function dlm:new_ticket

data modify storage dlm: ticket set value {id:"test3",pos:{x:1000,z:1101},life:{type:"wait",time:750}}
function dlm:new_ticket

data modify storage dlm: ticket set value {id:"test4",pos:{x:1000,z:1101},life:{type:"wait",time:1100}}
function dlm:new_ticket