intadmin.utility = intadmin.utility or {}
local u = intadmin.utility

function u.valueInTable(tbl, val)
	for _, v in pairs(tbl) do
		if v == val then return true end
	end
	return false
end

function u.makeHeader()
	print("+------------------------------------------------------------------------------+")
end

function u.indexInTable(tbl, index)
	for v, _ in pairs(tbl) do
		if v == index then return true end
	end
	return false
end

function intadmin.utility.isTable(tbl)
		return type(tbl) == "table"
end

function u.includeFolder(path, base)
	-- Make the variables local.
	local path, searchPath, base, spacer = path, "", base, 0
	-- Get the area for the search.
	if not base then base = "LUA" end
	-- Get the path and search path.
	if path:EndsWith("*") then path = string.sub(path, 1, -2) end
	if not path:EndsWith("/") then path = path.."/" end
	searchPath = path.."*"
	-- Get the files in the directory.
	files = file.Find(searchPath, base)
	for _, varFile in pairs(files) do
		if varFile == "sh_util.lua" then
			varFile = ""
		end
		if file.IsDir(varFile, base) then
			includeFolder(varFile, base)
		else
			spacer = 57-#varFile
			spacer = string.rep(" ", spacer)
			if varFile:StartWith("sh_") then
				if SERVER then
					AddCSLuaFile(path..varFile)
					include(path..varFile)
				else
					include(path..varFile)
				end
				print("| [SHARED] Included: "..varFile..spacer.."|")
			elseif varFile:StartWith("sv_") then
				if SERVER then include(path..varFile) end
				print("| [SERVER] Included: "..varFile..spacer.." |")
			elseif varFile:StartWith("cl_") then
				print("| [SERVER] Included: "..varFile..spacer.." |")
			end
		end
	end
end

u.includeFolder("internetadmin/shared", "LUA")

print("util end")
print("--------"..os.date("%d/%m/%y - %H:%M").."----------")