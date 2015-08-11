if (SERVER) then return end

intadmin = intadmin or {}

print("| [CLIENT] - Loading Clientside Init File.        |")

print("| [SHARED] - Including sh_defines.lua             |")
include("internetadmin/shared/sh_defines.lua")
	
print("| [SHARED] - Including sh_groups.lua              |")
include("internetadmin/shared/sh_groups.lua")

print("| [SHARED] - Including sh_funcs.lua               |")
include("internetadmin/shared/sh_funcs.lua")

print("| [SHARED] - Including sh_plymeta.lua             |")
include("internetadmin/shared/sh_plymeta.lua")

print("| [SHARED] - Including sh_groupfunctions.lua      |")
include("internetadmin/shared/sh_groupfunctions.lua")
	
print("| [SHARED] - Including sh_alias.lua               |")
include("internetadmin/shared/sh_alias.lua")