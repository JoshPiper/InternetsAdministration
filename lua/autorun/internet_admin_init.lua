-- Make it very simple, refer to our initialisation files.
-- Also include some fancy headers. Since, you know, why not?
hook.Call
print("+-------------------------------------------------+")
print("| Welcome to Internet's Administration            |")
print("| We are now loading all our files. Please wait.  |")
print("+-------------------------------------------------+")
if intadmin.init == true then
	intadmin = nil
	print("| intadmin already defined - Reloading files      |")
	print("+-------------------------------------------------+")
end
if (SERVER) then
	print("| [SERVER] - Including IA Server Init File.       |")
	include("internetadmin/init.lua")
	print("| [SERVER] - Including Server-Client Lua DLs List |")
	include("internetadmin/downloads.lua")
else
	print("| [CLIENT] - Including IA Client Init File.       |")
	include("internetadmin/cl_init.lua")
end
print("| [SHARED] - Loading Complete                     |")
intadmin.init = true
print("+-------------------------------------------------+")
print("| Thank you for using Internet's Administration   |")
print("| Thank you, and have a safe and productive day!  |")
print("+-------------------------------------------------+")
hook.Call