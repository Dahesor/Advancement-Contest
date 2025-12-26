execute if score has_mansion gen matches 1.. run return fail
tellraw @a [{text:"\n[gen:main] 尝试决定放置一个林地府邸",color:"dark_gray"}]

function gen:ter/b_fetch/call

data modify storage gen b_fetch.fallback set value 31
data modify storage gen b_fetch.id set value "#has_structure/woodland_mansion"