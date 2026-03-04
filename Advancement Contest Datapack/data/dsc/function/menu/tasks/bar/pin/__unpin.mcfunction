$data remove storage main: player[0].task.pin[{id:"$(id)"}]
$data remove storage main: player[0].task.unpin[{id:"$(id)"}]
$data modify storage main: player[0].task.unpin append value {id:"$(id)"}