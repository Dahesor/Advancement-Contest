scoreboard players set #from_x dlm__ 0
scoreboard players set #from_z dlm__ 0
execute store result score #from_x dlm__ run data get storage dlm: n_t.pos.x
execute store result score #from_z dlm__ run data get storage dlm: n_t.pos.z
scoreboard players operation #to_x dlm__ = #from_x dlm__
scoreboard players operation #to_z dlm__ = #from_z dlm__
execute if data storage dlm: n_t.to store result score #to_x dlm__ run data get storage dlm: n_t.to.x
execute if data storage dlm: n_t.to store result score #to_z dlm__ run data get storage dlm: n_t.to.z
scoreboard players operation x dlm__ = #from_x dlm__
scoreboard players operation x dlm__ < #to_x dlm__
scoreboard players operation dx dlm__ = #to_x dlm__
scoreboard players operation dx dlm__ > #from_x dlm__
scoreboard players operation z dlm__ = #from_z dlm__
scoreboard players operation z dlm__ < #to_z dlm__
scoreboard players operation dz dlm__ = #to_z dlm__
scoreboard players operation dz dlm__ > #from_z dlm__

scoreboard players operation cx dlm__ = x dlm__
scoreboard players operation cx dlm__ /= #16 dlm__
scoreboard players operation cz dlm__ = z dlm__
scoreboard players operation cz dlm__ /= #16 dlm__
scoreboard players operation dcx dlm__ = dx dlm__
scoreboard players operation dcx dlm__ /= #16 dlm__
scoreboard players operation dcz dlm__ = dz dlm__
scoreboard players operation dcz dlm__ /= #16 dlm__