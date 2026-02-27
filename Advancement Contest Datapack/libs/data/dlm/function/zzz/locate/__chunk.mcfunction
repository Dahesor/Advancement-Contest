$execute unless data storage dlm: data[0].Chunks[{cx:$(cx),cz:$(cz)}] run return run data modify storage dlm: data[0].Chunks prepend value {cx:$(cx),cz:$(cz),tickets:[]}

$data modify storage dlm: This_Chunk set from storage dlm: data[0].Chunks[{cx:$(cx),cz:$(cz)}]
$data remove storage dlm: data[0].Chunks[{cx:$(cx),cz:$(cz)}]
data modify storage dlm: data[0].Chunks prepend from storage dlm: This_Chunk