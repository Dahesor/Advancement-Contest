execute unless data storage dsc:task temp[0] run return fail

data modify storage dsc:task run set from storage dsc:task temp[0]
function registry:validation/to_track_list
data modify storage team: track_list.mod append from storage team: track_list.this

data remove storage dsc:task temp[0]
function registry:validation/tree