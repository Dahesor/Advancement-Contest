execute store result score #x calc.DSC run data get storage team: outpost.this[0].x
execute store result score #z calc.DSC run data get storage team: outpost.this[0].z

execute if score #x calc.DSC < current_x_min main run return fail
execute if score #x calc.DSC > current_x_max main run return fail
execute if score #z calc.DSC < current_z_min main run return fail
execute if score #z calc.DSC > current_z_max main run return fail
return 1