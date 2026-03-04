$data remove storage team: track_list.run[{id:"$(id)"}]
$data remove storage main: player[].task.pin[{id:"$(id)"}]
$data remove storage main: player[].task.unpin[{id:"$(id)"}]