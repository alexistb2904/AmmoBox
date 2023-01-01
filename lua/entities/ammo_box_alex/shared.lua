ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Ammo Box"
ENT.Author = "alexistb2904"
ENT.Category = "Ammo Box"
ENT.Spawnable = true


function ENT:Initialize()
    surface.CreateFont("AmmoBox_Owner", {
        font = "Roboto", 
        size = ScreenScale( 11 ), 
        weight = ScreenScale( 2 ),
        antialias = true
    })
    surface.CreateFont("AmmoBox_Font", {
        font = "Roboto", 
        size = numberw*0.015, 
        weight = ScreenScale( 7 )
    })
    
    surface.CreateFont("AmmoBox_BtnFont", {
        font = "Roboto", 
        size = numberw*0.01, 
        weight = ScreenScale( 6 )
    })
    if engine.ActiveGamemode() == "darkrp" then
        owner = self:CPPIGetOwner()
        self:SetOwner(owner)
        self:CPPISetOwner(self:GetOwner())
    else
        if CH_Ammo_Box.Config.JobRestrictions == true then
            CH_Ammo_Box.Config.JobRestrictions = false
        end
    end
end


