local meta = FindMetaTable("Player")

function meta:QueryAccess(accessTag)
	intadmin.acl.query(self, accessTag)
end

function meta:GetUserGroup()
	intadmin.acl.getgroup(self)
end
