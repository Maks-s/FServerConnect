AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )

include('shared.lua')

function ENT:Initialize( )
	self:SetModel( FServerConnect.Model )
	self:SetHullType( HULL_HUMAN )
	self:SetHullSizeNormal()
	self:SetNPCState( NPC_STATE_SCRIPT )
	self:SetSolid( SOLID_BBOX )
	self:CapabilitiesAdd( CAP_ANIMATEDFACE || CAP_TURN_HEAD )
	self:SetUseType( SIMPLE_USE )
	self:DropToFloor()
end 

util.AddNetworkString("FSC:Ply:OpenMenu")

function ENT:Use( _, Caller )	
	if IsValid( Caller ) && Caller:IsPlayer() then
		net.Start( "FSC:Ply:OpenMenu" )
		net.Send( Caller )
	end
end