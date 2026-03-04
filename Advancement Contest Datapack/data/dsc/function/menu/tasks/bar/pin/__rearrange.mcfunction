$data modify storage run t set from storage temp l[{id:"$(id)"}]
$data remove storage temp l[{id:"$(id)"}]
data modify storage temp l prepend from storage run t