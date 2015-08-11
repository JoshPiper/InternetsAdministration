intadmin.acl = intadmin.acl or {}

function intadmin.acl.makeGroup(identifier, override=false)
	if not identifier then error("No Identifier Provided to Make Group Function") end
	if intadmin.utility.isTable(intadmin.acl.grouplist[identifier]) then
		if not override then
			error("Pre-existing Group Defined as Identifier in makeGroup function.")
		else
			intadmin.acl.grouplist[identifier] = {}
		end
		intadmin.acl.grouplist[identifier] = {}
	end
end

function intadmin.acl.getGroupInheretenceRecursionOld(group, endGroup)
	local counts = 0
	local newTest = intadmin.acl.getGroupFromIdentifier(group).inheritsFrom
	local inheritablegroups = {}
	while (not (testNew == endGroup or test == "user")) and counts < 100 do
		for group, data in pairs(intadmin.acl.getGroupFromIdentifier(intadmin.acl.getGroupInheretence(group))) do
			counts = counts + 1
			if group == newTest then
				newTest = data.inheritsFrom
				table.insert(inheritblegroups, group)
			end
		end
	end
	
	PrintTable(inheritablegroups)
	return inheritablegroups
end

function intadmin.acl.withThanksUlib() -- With thanks to Team Ulysses
	local inherits = { ["user"]={} } -- I couldn't write this.
	local find = { ["user"]=inherits["user"] }
	for group, _ in pairs( intadmin.acl.grouplist ) do
		if group ~= "user" then
			local inherits_from = intadmin.acl.getGroupInheretence( group )
			if not inherits_from then inherits_from = "user" end

			find[ inherits_from ] = find[ inherits_from ] or {} -- Use index if it exists, otherwise create one for this group
			find[ group ] = find[ group ] or {} -- If someone's created our index, use it. Otherwise, create one.
			find[ inherits_from ][ group ] = find[ group ]
		end
	end

	return inherits
end

function intadmin.acl.query(ply, access)
	local grantAccess = 0
	local groups, group, tag
	-- grouplist[group][tag][access]
	-- See if the group has access.
	for _, group in pairs(intadmin.acl.grouplist) do
		if intadmin.valueInTable(group.playerlist, ply:SteamID()) then
			for tag, var in pairs(group.accesslist) do
				if tag == access then
					if var == "ALLOW" then
						grantAccess = 1
					end
					if var == "DENY" then
						grantAccess = -1
					end
				end
			end
		end
	end
	return grantAccess
end

function intadmin.acl.getGroupFromIdentifier(id)
	if type(intadmin.acl.grouplist[id]) == nil then
		print("No Group Found for "..id)
		return intadmin.acl.grouplist.user
	else
		return intadmin.acl.grouplist[id]
	end
	
end

function intadmin.acl.getGroupInheretence(group)
	if not intadmin.acl.grouplist[group] then 
		return nil
	elseif not intadmin.acl.grouplist[group].inheritsFrom or intadmin.acl.grouplist[group].inheritsFrom == "" then
		return "user" 
	else
		return intadmin.acl.grouplist[group].inheritsFrom
	end
end


function intadmin.acl.addGroup(tag, printname, inherits, noremove, supressErrors)
	intadmin.acl.updateGroupList()
	assert(tag, "No tag for new group defined.")
	assert(printname, "Printname required for group.")
	intadmin.acl.grouplist[tag] = {}
	if not inherits or inherits == "" then inherets = "user" end
	if istable(intadmin.acl.grouplist[inherits]) or supressErrors then
		intadmin.acl.grouplist[tag].inheritsFrom = inheritsFrom
	else
		error("Incorrect inheritsfrom group.")
	end
	noremove = noremove or false
	
	if not type(intadmin.acl.grouplist[tag]) == "list" or intadmin.acl.grouplist[tag] == {} then
		error("Attempted to add existing group. Try modify?")
		return false
	else
		intadmin.acl.grouplist[tag] = {}
		intadmin.acl.grouplist[tag].name = printname
		intadmin.acl.grouplist[tag].inheritsFrom = inherits
		intadmin.acl.updateGroupList()
		return true
	end
end

function intadmin.acl.setGroupData(group, isSuperAdmin, isAdmin, isOperator, inheritsFrom)
	assert(group, "No group tag provided.")
	local group = intadmin.acl.grouplist[group]
	if type(isSuperAdmin) == "boolean" then
		intadmin.acl.grouplist[group].isSuperAdmin = isSuperAdmin
	end
	if type(isAdmin) == "boolean" then
		intadmin.acl.grouplist[group].isAdmin = isAdmin
	end
	if type(isOperator) == "boolean" then
		intadmin.acl.grouplist[group].isOperator = isOperator
	end
	if type(inheritsFrom) == "string" then
		if not inheritsFrom == "" and intadmin.utility.valueInTable(intadmin.acl.groups, inheritsFrom) then
			intadmin.acl.grouplist[group].inheritsFrom = inheritsFrom
			intadmin.acl.updateGroupList()
		else
			print(inheritsFrom)
			error("Incorrect inheritsfrom group.")
		end
	end
end 

function intadmin.acl.setGroupAccess(group, tag, access)
	assert(group, "No Group Provided")
	assert(tag, "No Access Tag Provided")
	assert(access, "No Access Level Provided")
end

function intadmin.acl.updateGroupList()
	intadmin.acl.groups = {}
	for id, _ in pairs(intadmin.acl.grouplist) do
		table.insert(intadmin.acl.	groups, id)
	end
end

local addGroup = intadmin.acl.addGroup
local editGroupData = intadmin.acl.editGroupData

addGroup("operator", "Moderator", "user", true, true)
addGroup("administrator", "Administrator", "operator", true)
addGroup("superadmin", "Supervising Administrator", "administrator", true) -- Add the administrative groups branch.

addGroup("donator", "Donator", "user", true)
addGroup("donoroperator", "Moderator", "donator", true)
addGroup("donoradmin", "Administrator", "donoroperator", true) -- Add the donator groups branch.
