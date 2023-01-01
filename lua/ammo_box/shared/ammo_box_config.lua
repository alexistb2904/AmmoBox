

CH_Ammo_Box = CH_Ammo_Box or {}
CH_Ammo_Box.Config = CH_Ammo_Box.Config or {}
CH_Ammo_Box.Ammo = CH_Ammo_Box.Ammo or {}
CH_Ammo_Box.AllowedTeams = CH_Ammo_Box.AllowedTeams or {}


CH_Ammo_Box.Config.currency = "$"

CH_Ammo_Box.Config.Title = "AmmoBox"
CH_Ammo_Box.Config.press = "Press [E]"
CH_Ammo_Box.Config.owner = "'s Ammo Box"
CH_Ammo_Box.Config.noowner = "AmmoBox"
CH_Ammo_Box.Config.noaccess = "You do not have access to this Ammo Box!"
CH_Ammo_Box.Config.buy = "Buy Ammo"
CH_Ammo_Box.Config.nomoney = "You do not have enough money!"
CH_Ammo_Box.Config.sold = "You have sold your Ammo for "
CH_Ammo_Box.Config.JobRestrictions = true
CH_Ammo_Box.Config.nameonbox = true
CH_Ammo_Box.Config.Debug = false

CH_Ammo_Box.Config.sellpercent = 0.5

CH_Ammo_Box.AllowedTeams = {
    [TEAM_CITIZEN] = true,
}

--[[
    Name = "Name of the ammo shown in the menu", 
    Desc = "Description of the ammo shown in the menu",
    Model = "Model of the ammo",
    Price = "Price of the ammo",
    Type = "Type of the ammo (ex: 9x19mm)", 
    Amount = "Amount of ammo given"
]]--


CH_Ammo_Box.Ammo = { 
{
    Name = "10x25mm", 
    Desc = "Ammo of 10x25mm", 
    Model = "models/Items/BoxSRounds.mdl",
    Price = 250, 
    Type = "10x25mm", 
    Amount = 20 
},
{
    Name = ".357 SIG", 
    Desc = "Ammo of .357 SIG", 
    Model = "models/Items/357ammo.mdl",
    Price = 250, 
    Type = ".357 SIG", 
    Amount = 20 
},
{
    Name = ".45 ACP", 
    Desc = "Ammo of .45 ACP", 
    Model = "models/Items/BoxSRounds.mdl",
    Price = 250, 
    Type = ".45 ACP", 
    Amount = 20 
},
{
    Name = "9x18mm", 
    Desc = "Ammo of 9x18mm", 
    Model = "models/Items/BoxSRounds.mdl",
    Price = 250, 
    Type = "9x18mm", 
    Amount = 20 
},
{
    Name = ".457 Casull", 
    Desc = "Ammo of .457 Casull", 
    Model = "models/Items/BoxSRounds.mdl",
    Price = 250, 
    Type = ".457 Casull", 
    Amount = 10 
},
{
    Name = ".50 AE", 
    Desc = "Ammo of .50 AE", 
    Model = "models/Items/BoxSRounds.mdl",
    Price = 250, 
    Type = ".50 AE", 
    Amount = 10 
},
{
    Name = "9x19mm", 
    Desc = "Ammo of 9x19mm", 
    Model = "models/Items/BoxMRounds.mdl",
    Price = 250, 
    Type = "9x19mm", 
    Amount = 30
},
{
    Name = ".12 gauge", 
    Desc = "Ammo of .12 gauge", 
    Model = "models/Items/BoxBuckshot.mdl",
    Price = 150, 
    Type = "12 Gauge", 
    Amount = 10 
},
{
    Name = "7.62x51mm", 
    Desc = "Ammo of 7.62x51mm", 
    Model = "models/Items/BoxMRounds.mdl",
    Price = 250, 
    Type = "7.62x51mm", 
    Amount = 10 
},
}