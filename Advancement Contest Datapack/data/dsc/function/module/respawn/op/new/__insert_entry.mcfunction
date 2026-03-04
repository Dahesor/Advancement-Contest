#team

$data modify storage team: outpost.$(team) append from storage team: outpost.new
$data modify storage team: outpost.next_update.$(team) set value -1