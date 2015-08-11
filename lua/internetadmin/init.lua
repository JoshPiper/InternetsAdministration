intadmin = {}
intadmin.name = "Internet's Administration"
intadmin.version = "0.0.0.3"

intadmin.utility = {}
intadmin.acl = {}

if (CLIENT) then return end

if type(intadmin) == "nil" then
	print("| [SERVER] - Loading Server Init File.            |")
	intadmin = {}
	
	print("+-------------------------------------------------+")
	print("| [SERVER] - Loading Base Modules                 |")
	include("internetadmin/shared/sh_util.lua")
	-- print("| [SERVER] - Loading sh_defines.lua                |")
	-- include("internetadmin/shared/sh_defines.lua")

	-- print("| [SERVER] - Loading sh_groups.lua                 |")
	-- include("internetadmin/shared/sh_groups.lua")

	-- print("| [SERVER] - Loading sh_funcs.lua                  |")
	-- include("internetadmin/shared/sh_funcs.lua")

	-- print("| [SERVER] - Loading sh_plymeta.lua                |")
	-- include("internetadmin/shared/sh_plymeta.lua")

	-- print("| [SERVER] - Loading sh_groupfunctions.lua         |")
	-- include("internetadmin/shared/sh_groupfunctions.lua")
	
	-- print("| [SERVER] - Loading sh_alias.lua                  |")
	-- include("internetadmin/shared/sh_alias.lua")
end