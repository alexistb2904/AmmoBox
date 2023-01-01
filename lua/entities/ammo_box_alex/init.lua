AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")
include("cl_init.lua")


function ENT:Initialize()
    CH_Ammo_Box = CH_Ammo_Box or {}
    CH_Ammo_Box.Config = CH_Ammo_Box.Config or {}
    CH_Ammo_Box.Ammo = CH_Ammo_Box.Ammo or {}
    CH_Ammo_Box.AllowedTeams = CH_Ammo_Box.AllowedTeams or {}
    self:SetModel("models/alexprops/ammobox.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)

    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:Wake()
    end
    
end

function ENT:Use( ply , caller ) 
	if IsValid( caller ) then
        if engine.ActiveGamemode() == "darkrp" then
            owner = self:CPPIGetOwner()
            print(table.ToString(CH_Ammo_Box.AllowedTeams, "AllowedTeams", true))
            if self:CPPIGetOwner() == nil then
                if CH_Ammo_Box.Config.JobRestrictions == true then
                    if CH_Ammo_Box.AllowedTeams[caller:Team()] then	
                        net.Start( "AmmoBox_Menu_NoOwner" )
                        net.Send( caller )
                        if CH_Ammo_Box.Config.Debug == true then
                            print( "Ammo Box No Owner Menu Sent")
                        end
                    else
                        DarkRP.notify( caller, 1, 5, CH_Ammo_Box.Config.noaccess )
                    end
                else
                    net.Start( "AmmoBox_Menu_NoOwner" )
                    net.Send( caller )
                    if CH_Ammo_Box.Config.Debug == true then
                        print( "Ammo Box No Owner Menu Sent")
                    end
                end
            else
                if CH_Ammo_Box.Config.JobRestrictions == true then
                    if CH_Ammo_Box.AllowedTeams[caller:Team()] then	
                        net.Start( "AmmoBox_Menu" )
                        net.Send( caller , owner )
                        if CH_Ammo_Box.Config.Debug == true then
                            print( "Ammo Box Menu Sent")
                        end
                    else
                        DarkRP.notify( caller, 1, 5, CH_Ammo_Box.Config.noaccess )
                    end
                else
                    net.Start( "AmmoBox_Menu" )
                    net.Send( caller )
                    if CH_Ammo_Box.Config.Debug == true then
                        print( "Ammo Box Menu Sent")
                    end
                end
            end
        else
            caller:PrintMessage( HUD_PRINTTALK, "This entity work only in DarkRP" )
        end
    end
end
