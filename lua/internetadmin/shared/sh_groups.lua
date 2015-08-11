if type(intadmin.acl) == "table" then intadmin.acl = intadmin.acl else intadmin.acl = {} end
if type(intadmin.acl.playerlist) == "table" then intadmin.acl.playerlist = intadmin.acl.playerlist else intadmin.acl.playerlist = {} end
if type(intadmin.acl.grouplist) == "table" then intadmin.acl.grouplist = intadmin.acl.grouplist else intadmin.acl.grouplist = {} end


-- intadmin.acl.plylist[ply][tag][access]
-- intadmin.acl.grouplist[group][tag][access]

--[[intadmin.acl.grouplist.superadmin = {}
intadmin.acl.grouplist.superadmin.name = "Super-Administrator"
intadmin.acl.grouplist.superadmin.playerlist = {"STEAM_0:1:35377420"}
intadmin.acl.grouplist.superadmin.accesslist = {kick = "ALLOW", ban = "ALLOW", unban = "ALLOW", mute = "ALLOW", gag = "ALLOW"}
intadmin.acl.grouplist.superadmin.inheritsFrom = "admin"
intadmin.acl.grouplist.superadmin.noremove = true

intadmin.acl.grouplist.admin = {}
intadmin.acl.grouplist.admin.name = "Administrator"
intadmin.acl.grouplist.admin.playerlist = {}
intadmin.acl.grouplist.admin.accesslist = {kick = "ALLOW", ban = "ALLOW", mute = "ALLOW", gag = "ALLOW"}
intadmin.acl.grouplist.admin.inheritsFrom = "operator"
intadmin.acl.grouplist.admin.noremove = true

intadmin.acl.grouplist.operator = {}
intadmin.acl.grouplist.operator.name = "Operator"
intadmin.acl.grouplist.operator.playerlist = {}
intadmin.acl.grouplist.operator.accesslist = {kick = "ALLOW"}
intadmin.acl.grouplist.operator.inheritsFrom = "user"
intadmin.acl.grouplist.operator.noremove = true

intadmin.acl.grouplist.user = {}
intadmin.acl.grouplist.user.name = "User"
intadmin.acl.grouplist.user.playerlist = {}
intadmin.acl.grouplist.user.accesslist = {}
intadmin.acl.grouplist.user.inheritsFrom = nil
intadmin.acl.grouplist.user.noremove = true
intadmin.acl.grouplist.user.defaultGroup = true

intadmin.acl.grouplist.donator = {}
intadmin.acl.grouplist.donator.name = "donator"
intadmin.acl.grouplist.donator.playerlist = {}
intadmin.acl.grouplist.donator.accesslist = {}
intadmin.acl.grouplist.donator.inheritsFrom = "user"
intadmin.acl.grouplist.donator.noremove = true
intadmin.acl.grouplist.donator.defaultGroup = true

intadmin.acl.grouplist.donormod = {}
intadmin.acl.grouplist.donormod.name = "donormod"
intadmin.acl.grouplist.donormod.playerlist = {}
intadmin.acl.grouplist.donormod.accesslist = {}
intadmin.acl.grouplist.donormod.inheritsFrom = "donator"
intadmin.acl.grouplist.donormod.noremove = true

intadmin.acl.grouplist.donoradmin = {}
intadmin.acl.grouplist.donoradmin.name = "donoradmin"
intadmin.acl.grouplist.donoradmin.playerlist = {}
intadmin.acl.grouplist.donoradmin.accesslist = {}
intadmin.acl.grouplist.donoradmin.inheritsFrom = "donormod"
intadmin.acl.grouplist.donoradmin.noremove = true]]--

intadmin.acl.defaultGroup = "user"

intadmin.acl.groups = {}
for id, _ in pairs(intadmin.acl.grouplist) do
	table.insert(intadmin.acl.groups, id)
end

function intadmin.acl.getInheretedPerms(group)
	local sourceGroup = intadmin.acl.grouplist[group]
	local inheretedGroup = intadmin.acl.grouplist[sourceGroup.inheritsFrom]
	
end

print("| [SHARED] - Including sh_groupfunctions.lua      |")
include("sh_groupfunctions.lua")