-- INITIALIZE SCRIPT
hook.Add("OnGamemodeLoaded", "Load_Allowed", function()
if SERVER then
	for k, v in ipairs( file.Find( "ammo_box/shared/*.lua", "LUA" ) ) do
		include( "ammo_box/shared/" .. v )
	end
	
	for k, v in ipairs( file.Find( "ammo_box/shared/*.lua", "LUA" ) ) do
		AddCSLuaFile( "ammo_box/shared/" .. v )
	end
	
	for k, v in ipairs( file.Find( "ammo_box/server/*.lua", "LUA" ) ) do
		include( "ammo_box/server/" .. v )
	end
	
	for k, v in ipairs( file.Find( "ammo_box/client/*.lua", "LUA" ) ) do
		AddCSLuaFile( "ammo_box/client/" .. v )
	end
end
if CLIENT then
	for k, v in ipairs( file.Find( "ammo_box/shared/*.lua", "LUA" ) ) do
		include( "ammo_box/shared/" .. v )
	end
	
	for k, v in ipairs( file.Find( "ammo_box/client/*.lua", "LUA" ) ) do
		include( "ammo_box/client/" .. v )
	end
end
end)