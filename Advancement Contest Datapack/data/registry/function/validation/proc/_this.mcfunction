data modify storage run id set value {id:""}
data modify storage run id.id set from storage dsc:task proc_list[0]
function registry:validation/proc/__get_entry with storage run id
function registry:validation/proc/next