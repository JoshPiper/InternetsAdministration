print("+-------------------------------------------------+")
print("| [SERVER] - Populating Lua File Downloads List   |")

local inc = AddCSLuaFile

print("| [SERVER] - Adding Client Init file to DL list.  |")
inc("internetadmin/cl_init.lua")

print("| [SERVER] - Adding sh_defines.lua                |")
inc("internetadmin/shared/sh_defines.lua")

print("| [SERVER] - Adding sh_groups.lua                 |")
inc("internetadmin/shared/sh_groups.lua")

print("| [SERVER] - Adding sh_plymeta.lua                |")
inc("internetadmin/shared/sh_plymeta.lua")

print("| [SERVER] - Adding sh_groupfunctions.lua         |")
inc("internetadmin/shared/sh_groupfunctions.lua")


print("| [SERVER] - Downloads List Populated             |")
print("+-------------------------------------------------+")