net.Receive( "Buy_Ammo", function( length, ply )
    print("Buy_Ammo")
    local id = net.ReadDouble()
    local am = CH_Ammo_Box.Ammo[ id ]

    if ply:canAfford(am.Price) then
        ply:GiveAmmo( am.Amount, am.Type )
		DarkRP.notify( ply, 0, 5, "Vous avez récupéré ".. am.Amount .." balles de ".. am.Type .. " pour " .. am.Price .. " " .. CH_Ammo_Box.Config.currency )
        ply:addMoney(-am.Price)
        owner:addMoney(am.Price * CH_Ammo_Box.Config.sellpercent)
        DarkRP.notify( owner, 0, 5, CH_Ammo_Box.Config.sold .. am.Price * CH_Ammo_Box.Config.sellpercent .. CH_Ammo_Box.Config.currency .. " ( x" ..am.Amount .. " " .. am.Type .. " ) ")
        
    else
        DarkRP.notify( ply, 1, 5, CH_Ammo_Box.Config.nomoney)
    end
end)

net.Receive( "Buy_Ammo_NoOwner", function( length, ply )
    print("Buy_Ammo_NoOwner")
    local id = net.ReadDouble()
    local am = CH_Ammo_Box.Ammo[ id ]

    if ply:canAfford(am.Price) then
        ply:GiveAmmo( am.Amount, am.Type )
		DarkRP.notify( ply, 0, 5, "Vous avez récupéré ".. am.Amount .." balles de ".. am.Type .. " pour " .. am.Price .. " " .. CH_Ammo_Box.Config.currency )
        ply:addMoney(-am.Price)
        Msg( "Admin Ammo Box Sell " .. am.Price * CH_Ammo_Box.Config.sellpercent .. CH_Ammo_Box.Config.currency .. " ( x" ..am.Amount .. " " .. am.Type .. " ) ")
        
    else
        DarkRP.notify( ply, 1, 5, CH_Ammo_Box.Config.nomoney)
    end
end)

