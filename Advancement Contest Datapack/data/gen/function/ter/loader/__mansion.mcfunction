execute if score has_mansion gen matches 1.. run return fail
data modify storage gen gen_log prepend value [{text:"\n[gen:main] 尝试决定放置一个林地府邸\n",color:"gray"}]

function gen:ter/b_fetch/call

data modify storage gen b_fetch.fallback set value 31
data modify storage gen b_fetch.id set value "#has_structure/woodland_mansion"