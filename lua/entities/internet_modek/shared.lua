--[[---------------------------------------------------------------------------
Donator Suit Base
By Doctor Internet
---------------------------------------------------------------------------]]
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "base_suit"
ENT.Author = "Doctor Internet"
ENT.Spawnable = false
ENT.AdminSpawnable = true
ENT.Rank = "donator"
ENT.PlayerModel = "models/player/kleiner.mdl"
ENT.PlayerModelName = "Kleiner Suit"
ENT.Contact			= "Don't"
ENT.Purpose			= "Exemplar material"
ENT.Instructions = "stuff"

function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "owning_ent")
end
