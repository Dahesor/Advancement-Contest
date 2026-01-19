$data modify storage run Player set from storage main: player[{UID:$(UID)}]
$data remove storage main: player[{UID:$(UID)}]
data modify storage main: player prepend from storage run Player