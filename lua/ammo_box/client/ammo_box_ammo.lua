local background = Color( 50, 50, 50, 200)
local box_color = Color( 70, 70, 70, 200)
local box_color2 = Color( 70, 70, 70)
local button_color_close = Color( 173, 20, 20)
local button_color_close_h = Color( 134, 16, 16)
local button_color_enough = Color( 6, 155, 1)
local button_color_noenough = Color( 155, 0, 0)
local button_color_enough_h = Color( 4, 110, 0)
local button_color_noenough_h = Color( 110, 0, 0)
local text_color = Color( 255, 255, 255)

numberh = ScrH() * 0.55
numberw = ScrW() * 0.60 


surface.CreateFont("AmmoBox_Owner", {
	font = "Roboto", 
	size = ScreenScale( 11 ), 
	weight = ScreenScale( 2 ),
	antialias = true
})
surface.CreateFont("AmmoBox_Font", {
	font = "Roboto", 
	size = numberw*0.025, 
	weight = ScreenScale( 7 )
})

surface.CreateFont("AmmoBox_BtnFont", {
	font = "Roboto", 
	size = numberw*0.02, 
	weight = ScreenScale( 6 )
})

net.Receive( "AmmoBox_Menu", function( len, ply )
	if CH_Ammo_Box.Config.Debug == true then
		print(owner)
		print("AmmoBox_Menu Received")
		print (CH_Ammo_Box.Ammo)
	end
    numberh = ScrH() * 0.55
    numberw = ScrW() * 0.60 
    local Ammobox_GUI = vgui.Create("DFrame")
	Ammobox_GUI:SetTitle("")
	Ammobox_GUI:SetSize( numberw, numberh )
	Ammobox_GUI:Center()
    Ammobox_GUI:GetBackgroundBlur()
	Ammobox_GUI.Paint = function( self, w, h )
        draw.RoundedBoxEx( 15, 0, 0, numberw*0.995, numberh*0.995, background, true , true, true, true )
        draw.RoundedBoxEx( 15, 0, 0, numberw*0.995, numberh*0.065, box_color, true, true, false, false )
        draw.SimpleText( CH_Ammo_Box.Config.Title, "AmmoBox_Font", numberw*0.01, numberh*0.038, text_color, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
        gamemodename = engine.ActiveGamemode()
    Ammobox_GUI:MakePopup()
    Ammobox_GUI:SetDraggable( false )
    Ammobox_GUI:ShowCloseButton( false )
    end

    local Ammobox_GUI_EXIT = vgui.Create( "DButton", Ammobox_GUI )
	Ammobox_GUI_EXIT:SetSize( ScrW() * 0.015, ScrW() * 0.015 )
	Ammobox_GUI_EXIT:SetPos( numberw * 0.96, numberh*0.01 )
	Ammobox_GUI_EXIT:SetText( "" )
	Ammobox_GUI_EXIT.Paint = function( self, w, h )
		if self:IsHovered() then
			draw.RoundedBox( 8, 1, 1, w, h, button_color_close_h )
		else
			draw.RoundedBox( 8, 1, 1, w, h, button_color_close )
		end
	end
	Ammobox_GUI_EXIT.DoClick = function()
		Ammobox_GUI:Remove()
    end

    local Ammobox_ITEM = vgui.Create( "DPanelList", Ammobox_GUI )
	Ammobox_ITEM:SetSize( numberw*0.978, numberh*0.91 )
	Ammobox_ITEM:SetPos( numberw*0.008, numberh*0.06 )
	Ammobox_ITEM:EnableVerticalScrollbar( true )
	Ammobox_ITEM:EnableHorizontal( true )
	Ammobox_ITEM.Paint = function( self, w, h )
		draw.RoundedBox( 2, 0, 2, w, h, color_transparent )
	end
    if ( Ammobox_ITEM.VBar ) then
		Ammobox_ITEM.VBar.Paint = function( self, w, h )
			draw.RoundedBoxEx( 0, 0, 0, w, h, color_transparent ) -- BG
		end
		Ammobox_ITEM.VBar.btnUp.Paint = function( self, w, h )
			draw.RoundedBox( 4, 0, 2, w, h, color_transparent )
		end
		Ammobox_ITEM.VBar.btnGrip.Paint = function( self, w, h )
			draw.RoundedBoxEx( 16, 4, 3, w*0.5, h, text_color, true, true, true, true )
		end
		Ammobox_ITEM.VBar.btnDown.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, color_transparent )
		end
	end
    for k, am in pairs(CH_Ammo_Box.Ammo) do
		if am.Name then
			local Ammobox_ITEM_PANEL = vgui.Create("DPanelList")
			Ammobox_ITEM_PANEL:SetSize( numberw * 0.96, numberh * 0.35 )
			Ammobox_ITEM_PANEL:SetPos( numberw * 0.4, numberh * 0.5 )
			Ammobox_ITEM_PANEL:SetSpacing( 10 )
			Ammobox_ITEM_PANEL.Paint = function( self, w, h )
			draw.RoundedBox( 5, numberw * 0.008, numberh * 0.015, w, h, box_color )
			-- Weapon model frame
			draw.RoundedBoxEx( 5, numberw * 0.011, numberh * 0.0215, numberw * 0.213, numberh * 0.32, box_color2 , true , false , true , false)
			-- Weapon text frame
			draw.RoundedBoxEx( 5, numberw * 0.23, numberh * 0.0215, numberw * 0.725, numberh * 0.32, box_color2 , false , true , false , true)
			end
				
			surface.SetFont( "AmmoBox_Font" )
			local x, y = surface.GetTextSize( am.Name )
			local Ammobox_ITEM_NAME = vgui.Create( "DLabel", Ammobox_ITEM_PANEL )
			Ammobox_ITEM_NAME:SetPos( numberw * 0.025, numberh * 0.041 )
			Ammobox_ITEM_NAME:SetFont( "AmmoBox_Font" )
			Ammobox_ITEM_NAME:SetColor( color_white )
			Ammobox_ITEM_NAME:SetText( am.Name )
			Ammobox_ITEM_NAME:SizeToContents()

			local Ammobox_ITEM_AMOUNT = vgui.Create( "DLabel", Ammobox_ITEM_PANEL )
			Ammobox_ITEM_AMOUNT:SetPos( numberw * 0.18, numberh * 0.29 )
			Ammobox_ITEM_AMOUNT:SetFont( "AmmoBox_Font" )
			Ammobox_ITEM_AMOUNT:SetColor( color_white )
			Ammobox_ITEM_AMOUNT:SetText( "x" .. am.Amount )
			Ammobox_ITEM_AMOUNT:SizeToContents()

			local Ammobox_ITEM_ICON = vgui.Create( "DModelPanel", Ammobox_ITEM_PANEL )
			Ammobox_ITEM_ICON:SetPos( numberw * 0.008, numberh * 0.035 )
			Ammobox_ITEM_ICON:SetSize( numberw * 0.22, numberw * 0.18 )
			Ammobox_ITEM_ICON:SetModel( am.Model )
			Ammobox_ITEM_ICON:GetEntity():SetAngles( Angle( -10, 10, 15 ) )
			local mn, mx = Ammobox_ITEM_ICON.Entity:GetRenderBounds()
			local size = 0
			size = math.max( size, math.abs( mn.x ) + math.abs( mx.x ) )
			size = math.max( size, math.abs( mn.y ) + math.abs( mx.y ) )
			size = math.max( size, math.abs( mn.z ) + math.abs( mx.z ) )
			Ammobox_ITEM_ICON:SetFOV( 70 )
			Ammobox_ITEM_ICON:SetCamPos( Vector( size, size, size ) )
			Ammobox_ITEM_ICON:SetLookAt( (mn + mx) * 0.5 )
			function Ammobox_ITEM_ICON:LayoutEntity( Entity ) return end
				
			-- Weapon Description
			local Ammobox_ITEM_DESC = vgui.Create( "DLabel", Ammobox_ITEM_PANEL )
			Ammobox_ITEM_DESC:SetPos( numberw * 0.24, numberh * 0.041 )
			Ammobox_ITEM_DESC:SetFont( "AmmoBox_Font" )
			Ammobox_ITEM_DESC:SetColor( Color( 157, 157, 157) )
			Ammobox_ITEM_DESC:SetText( "Description" )
			Ammobox_ITEM_DESC:SizeToContents()
				
			local x, y = surface.GetTextSize( am.Desc )
			local Ammobox_ITEM_DESCTEXT = vgui.Create( "DLabel", Ammobox_ITEM_PANEL )
			if x <= 500 then
				Ammobox_ITEM_DESCTEXT:SetPos( numberw * 0.24, numberh * 0.005 )
			elseif x <= 1400 then
				Ammobox_ITEM_DESCTEXT:SetPos( numberw * 0.24, numberh * 0.027 )
			elseif x <= 2000 then
				Ammobox_ITEM_DESCTEXT:SetPos( numberw * 0.24, numberh * 0.03 )
			elseif x <= 2600 then
				Ammobox_ITEM_DESCTEXT:SetPos( numberw * 0.24, numberh * 0.04 )
			elseif x <= 3000 then
				Ammobox_ITEM_DESCTEXT:SetPos( numberw * 0.24, numberh * 0.075 )
			end
				
			Ammobox_ITEM_DESCTEXT:SetSize( numberw * 0.6, numberh * 0.2 )
			Ammobox_ITEM_DESCTEXT:SetFont( "AmmoBox_Font" )
			Ammobox_ITEM_DESCTEXT:SetColor( Color( 230, 230, 230, 230 ) )
			Ammobox_ITEM_DESCTEXT:SetWrap( true )
			Ammobox_ITEM_DESCTEXT:SetText( am.Desc )
			-- Retrieve/Deposit Button
			local Ammobox_take = vgui.Create("DButton", Ammobox_ITEM_PANEL)
			Ammobox_take:SetPos( numberw * 0.815, numberh * 0.26  )
			Ammobox_take:SetSize( numberw * 0.13, numberh * 0.06 )
			Ammobox_take:SetText("")
			Ammobox_take.Paint = function( self, w, h )
				if LocalPlayer():canAfford(am.Price) then
					if self:IsHovered() then
						draw.RoundedBoxEx( 8, 0, 0, w, h, button_color_enough_h, true , true, true, true )
					else
						draw.RoundedBoxEx( 8, 0, 0, w, h, button_color_enough, true, true, true, true )
					end
				else
					if self:IsHovered() then
						draw.RoundedBoxEx( 8, 0, 0, w, h, button_color_noenough_h, true, true, true, true )
					else
						draw.RoundedBoxEx( 8, 0, 0, w, h, button_color_noenough, true, true, true, true )
					end
				end
				
				local text_ammo = CH_Ammo_Box.Config.buy
				if self:IsHovered() then
					draw.SimpleText( am.Price .. CH_Ammo_Box.Config.currency, "AmmoBox_BtnFont", w / 2, h / 2, text_color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				else
					draw.SimpleText( text_ammo, "AmmoBox_BtnFont", w / 2, h / 2, text_color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				end
			end
                
            Ammobox_take.DoClick = function()
				Ammobox_GUI:Remove()
				net.Start( "Buy_Ammo" )
				net.WriteDouble( k )
				net.SendToServer()
			end
			Ammobox_ITEM:AddItem( Ammobox_ITEM_PANEL )
        end
    end
end)

net.Receive( "AmmoBox_Menu_NoOwner", function( len, ply )
	if CH_Ammo_Box.Config.Debug == true then
		print(owner)
		print("AmmoBox Menu No Owner Received")
	end
    numberh = ScrH() * 0.55
    numberw = ScrW() * 0.60 
    local Ammobox_GUI = vgui.Create("DFrame")
	Ammobox_GUI:SetTitle("")
	Ammobox_GUI:SetSize( numberw, numberh )
	Ammobox_GUI:Center()
    Ammobox_GUI:GetBackgroundBlur()
	Ammobox_GUI.Paint = function( self, w, h )
        draw.RoundedBoxEx( 15, 0, 0, numberw*0.995, numberh*0.995, background, true , true, true, true )
        draw.RoundedBoxEx( 15, 0, 0, numberw*0.995, numberh*0.065, box_color, true, true, false, false )
        draw.SimpleText( CH_Ammo_Box.Config.Title, "AmmoBox_Font", numberw*0.01, numberh*0.038, text_color, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
        gamemodename = engine.ActiveGamemode()
    Ammobox_GUI:MakePopup()
    Ammobox_GUI:SetDraggable( false )
    Ammobox_GUI:ShowCloseButton( false )
    end

    local Ammobox_GUI_EXIT = vgui.Create( "DButton", Ammobox_GUI )
	Ammobox_GUI_EXIT:SetSize( ScrW() * 0.015, ScrW() * 0.015 )
	Ammobox_GUI_EXIT:SetPos( numberw * 0.96, numberh*0.01 )
	Ammobox_GUI_EXIT:SetText( "" )
	Ammobox_GUI_EXIT.Paint = function( self, w, h )
		if self:IsHovered() then
			draw.RoundedBox( 8, 1, 1, w, h, button_color_close_h )
		else
			draw.RoundedBox( 8, 1, 1, w, h, button_color_close )
		end
	end
	Ammobox_GUI_EXIT.DoClick = function()
		Ammobox_GUI:Remove()
    end

    local Ammobox_ITEM = vgui.Create( "DPanelList", Ammobox_GUI )
	Ammobox_ITEM:SetSize( numberw*0.978, numberh*0.91 )
	Ammobox_ITEM:SetPos( numberw*0.008, numberh*0.06 )
	Ammobox_ITEM:EnableVerticalScrollbar( true )
	Ammobox_ITEM:EnableHorizontal( true )
	Ammobox_ITEM.Paint = function( self, w, h )
		draw.RoundedBox( 2, 0, 2, w, h, color_transparent )
	end
    if ( Ammobox_ITEM.VBar ) then
		Ammobox_ITEM.VBar.Paint = function( self, w, h )
			draw.RoundedBoxEx( 0, 0, 0, w, h, color_transparent ) -- BG
		end
		Ammobox_ITEM.VBar.btnUp.Paint = function( self, w, h )
			draw.RoundedBox( 4, 0, 2, w, h, color_transparent )
		end
		Ammobox_ITEM.VBar.btnGrip.Paint = function( self, w, h )
			draw.RoundedBoxEx( 16, 4, 3, w*0.5, h, text_color, true, true, true, true )
		end
		Ammobox_ITEM.VBar.btnDown.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, color_transparent )
		end
	end
    for k, am in pairs(CH_Ammo_Box.Ammo) do
		if am.Name then
			local Ammobox_ITEM_PANEL = vgui.Create("DPanelList")
			Ammobox_ITEM_PANEL:SetSize( numberw * 0.96, numberh * 0.35 )
			Ammobox_ITEM_PANEL:SetPos( numberw * 0.4, numberh * 0.5 )
			Ammobox_ITEM_PANEL:SetSpacing( 10 )
			Ammobox_ITEM_PANEL.Paint = function( self, w, h )
			draw.RoundedBox( 5, numberw * 0.008, numberh * 0.015, w, h, box_color )
			-- Weapon model frame
			draw.RoundedBoxEx( 5, numberw * 0.011, numberh * 0.0215, numberw * 0.213, numberh * 0.32, box_color2 , true , false , true , false)
			-- Weapon text frame
			draw.RoundedBoxEx( 5, numberw * 0.23, numberh * 0.0215, numberw * 0.725, numberh * 0.32, box_color2 , false , true , false , true)
			end
				
			surface.SetFont( "AmmoBox_Font" )
			local x, y = surface.GetTextSize( am.Name )
			local Ammobox_ITEM_NAME = vgui.Create( "DLabel", Ammobox_ITEM_PANEL )
			Ammobox_ITEM_NAME:SetPos( numberw * 0.025, numberh * 0.041 )
			Ammobox_ITEM_NAME:SetFont( "AmmoBox_Font" )
			Ammobox_ITEM_NAME:SetColor( color_white )
			Ammobox_ITEM_NAME:SetText( am.Name )
			Ammobox_ITEM_NAME:SizeToContents()

			local Ammobox_ITEM_AMOUNT = vgui.Create( "DLabel", Ammobox_ITEM_PANEL )
			Ammobox_ITEM_AMOUNT:SetPos( numberw * 0.18, numberh * 0.29 )
			Ammobox_ITEM_AMOUNT:SetFont( "AmmoBox_Font" )
			Ammobox_ITEM_AMOUNT:SetColor( color_white )
			Ammobox_ITEM_AMOUNT:SetText( "x" .. am.Amount )
			Ammobox_ITEM_AMOUNT:SizeToContents()

			local Ammobox_ITEM_ICON = vgui.Create( "DModelPanel", Ammobox_ITEM_PANEL )
			Ammobox_ITEM_ICON:SetPos( numberw * 0.008, numberh * 0.035 )
			Ammobox_ITEM_ICON:SetSize( numberw * 0.22, numberw * 0.18 )
			Ammobox_ITEM_ICON:SetModel( am.Model )
			Ammobox_ITEM_ICON:GetEntity():SetAngles( Angle( -10, 10, 15 ) )
			local mn, mx = Ammobox_ITEM_ICON.Entity:GetRenderBounds()
			local size = 0
			size = math.max( size, math.abs( mn.x ) + math.abs( mx.x ) )
			size = math.max( size, math.abs( mn.y ) + math.abs( mx.y ) )
			size = math.max( size, math.abs( mn.z ) + math.abs( mx.z ) )
			Ammobox_ITEM_ICON:SetFOV( 70 )
			Ammobox_ITEM_ICON:SetCamPos( Vector( size, size, size ) )
			Ammobox_ITEM_ICON:SetLookAt( (mn + mx) * 0.5 )
			function Ammobox_ITEM_ICON:LayoutEntity( Entity ) return end
				
			-- Weapon Description
			local Ammobox_ITEM_DESC = vgui.Create( "DLabel", Ammobox_ITEM_PANEL )
			Ammobox_ITEM_DESC:SetPos( numberw * 0.24, numberh * 0.041 )
			Ammobox_ITEM_DESC:SetFont( "AmmoBox_Font" )
			Ammobox_ITEM_DESC:SetColor( Color( 157, 157, 157) )
			Ammobox_ITEM_DESC:SetText( "Description" )
			Ammobox_ITEM_DESC:SizeToContents()
				
			local x, y = surface.GetTextSize( am.Desc )
			local Ammobox_ITEM_DESCTEXT = vgui.Create( "DLabel", Ammobox_ITEM_PANEL )
			if x <= 500 then
				Ammobox_ITEM_DESCTEXT:SetPos( numberw * 0.24, numberh * 0.005 )
			elseif x <= 1400 then
				Ammobox_ITEM_DESCTEXT:SetPos( numberw * 0.24, numberh * 0.027 )
			elseif x <= 2000 then
				Ammobox_ITEM_DESCTEXT:SetPos( numberw * 0.24, numberh * 0.03 )
			elseif x <= 2600 then
				Ammobox_ITEM_DESCTEXT:SetPos( numberw * 0.24, numberh * 0.04 )
			elseif x <= 3000 then
				Ammobox_ITEM_DESCTEXT:SetPos( numberw * 0.24, numberh * 0.075 )
			end
				
			Ammobox_ITEM_DESCTEXT:SetSize( numberw * 0.6, numberh * 0.2 )
			Ammobox_ITEM_DESCTEXT:SetFont( "AmmoBox_Font" )
			Ammobox_ITEM_DESCTEXT:SetColor( Color( 230, 230, 230, 230 ) )
			Ammobox_ITEM_DESCTEXT:SetWrap( true )
			Ammobox_ITEM_DESCTEXT:SetText( am.Desc )
			-- Retrieve/Deposit Button
			local Ammobox_take = vgui.Create("DButton", Ammobox_ITEM_PANEL)
			Ammobox_take:SetPos( numberw * 0.815, numberh * 0.26  )
			Ammobox_take:SetSize( numberw * 0.13, numberh * 0.06 )
			Ammobox_take:SetText("")
			Ammobox_take.Paint = function( self, w, h )
				if LocalPlayer():canAfford(am.Price) then
					if self:IsHovered() then
						draw.RoundedBoxEx( 8, 0, 0, w, h, button_color_enough_h, true , true, true, true )
					else
						draw.RoundedBoxEx( 8, 0, 0, w, h, button_color_enough, true, true, true, true )
					end
				else
					if self:IsHovered() then
						draw.RoundedBoxEx( 8, 0, 0, w, h, button_color_noenough_h, true, true, true, true )
					else
						draw.RoundedBoxEx( 8, 0, 0, w, h, button_color_noenough, true, true, true, true )
					end
				end
				
				local text_ammo = CH_Ammo_Box.Config.buy
				if self:IsHovered() then
					draw.SimpleText( am.Price .. CH_Ammo_Box.Config.currency, "AmmoBox_BtnFont", w / 2, h / 2, text_color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				else
					draw.SimpleText( text_ammo, "AmmoBox_BtnFont", w / 2, h / 2, text_color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				end
			end
                
            Ammobox_take.DoClick = function()
				Ammobox_GUI:Remove()
				net.Start( "Buy_Ammo_NoOwner" )
				net.WriteDouble( k )
				net.SendToServer()
			end
			Ammobox_ITEM:AddItem( Ammobox_ITEM_PANEL )
        end
    end
end)