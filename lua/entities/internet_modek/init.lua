--[[---------------------------------------------------------------------------
Donator Suit Base
By Doctor Internet
---------------------------------------------------------------------------]]
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/props_c17/SuitCase_Passenger_Physics.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	phys:Wake()
end

function ENT:Use(activator, caller)
	local EntOwner = self:Getowning_ent()
	if activator:UniqueID() == EntOwner:UniqueID() then
		activator:SetModel(self.PlayerModel)
	end
end