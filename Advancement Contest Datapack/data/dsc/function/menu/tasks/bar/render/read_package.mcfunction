execute unless data storage main: p_tracks[0] run return fail
data modify storage main: track set from storage main: p_tracks[0]
data remove storage main: p_tracks[0]
return 1