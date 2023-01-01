AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    surface.CreateFont("AmmoBox_Owner", {
        font = "Roboto", 
        size = ScreenScale( 11 ), 
        weight = ScreenScale( 2 ),
        antialias = true
    })
    surface.CreateFont("AmmoBox_Font", {
        font = "Roboto", 
        size = ScreenScale( 10 ), 
        weight = ScreenScale( 7 )
    })  
    owner = self:CPPIGetOwner()
    self:SetOwner(owner)
end



function ENT:Draw()
    self:DrawModel()
    if engine.ActiveGamemode() == "darkrp" then
        if CH_Ammo_Box.Config.nameonbox == true then 
            if  self:CPPIGetOwner() == nil then
                local Dist = self:GetPos():Distance( EyePos() )
                if not LocalPlayer():Alive() then
                    return
                end
                if not IsValid( LocalPlayer() ) then
                    return
                end
                if Dist <= 200 then
                    local pos = self:GetPos() + self:GetRight() * 0 + self:GetUp() * 22.5 + self:GetForward() * -8
                    local ang = self:GetAngles()
                    ang:RotateAroundAxis(self:GetAngles():Up(), 90)
                    cam.Start3D2D(pos, ang, 0.1)
                    draw.SimpleText(CH_Ammo_Box.Config.noowner , "AmmoBox_Owner", 0, -95, Color(0, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    draw.SimpleText(CH_Ammo_Box.Config.press , "AmmoBox_Owner", 0, -20, Color(0, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    cam.End3D2D()
                end
            else
                local Dist = self:GetPos():Distance( EyePos() )
                if not LocalPlayer():Alive() then
                    return
                end
                if not IsValid( LocalPlayer() ) then
                    return
                end
                if Dist <= 200 then
                    local pos = self:GetPos() + self:GetRight() * 0 + self:GetUp() * 22.5 + self:GetForward() * -8
                    local ang = self:GetAngles()
                    ang:RotateAroundAxis(self:GetAngles():Up(), 90)
                    cam.Start3D2D(pos, ang, 0.1)
                    owner = self:CPPIGetOwner()
                    draw.SimpleText(owner:Nick() .. CH_Ammo_Box.Config.owner , "AmmoBox_Owner", 0, -95, Color(0, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    draw.SimpleText(CH_Ammo_Box.Config.press , "AmmoBox_Owner", 0, -20, Color(0, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    cam.End3D2D()
                end
            end
        end
    end
end