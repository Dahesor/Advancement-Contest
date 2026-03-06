data modify storage temp l set value []
data modify storage temp l append from storage main: player[0].task.result[{completed:true}]
data remove storage main: player[0].task.result[{completed:true}]
data modify storage main: player[0].task.result append from storage temp l[]