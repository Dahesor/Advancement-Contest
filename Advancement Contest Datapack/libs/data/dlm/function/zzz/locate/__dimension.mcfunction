$execute unless data storage dlm: data[{dimension:"$(dimension)"}] run return run data modify storage dlm: data prepend value {dimension:"$(dimension)",Chunks:[]}

$data modify storage dlm: This_Dimension set from storage dlm: data[{dimension:"$(dimension)"}]
$data remove storage dlm: data[{dimension:"$(dimension)"}]
data modify storage dlm: data prepend from storage dlm: This_Dimension