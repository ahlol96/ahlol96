--[[
Author = ah_lol96#0071
Credits = {
Scripting - ah_lol96#0071
UI Library - naypramx
]]--
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/naypramx/Ui__Project/Script/XeNonUi", true))()
_G.Color = Color3.fromRGB(85,0,255)
_G.Color2 = Color3.fromRGB(85,0,255)
local char = game:GetService("Workspace")["ah_lol96"]
library:CreateWatermark("Mek Hub")
local CenterHubNo1 = library:CreateWindow("AFRBH | Mek Hub",Enum.KeyCode.RightControl)
local Tab = CenterHubNo1:CreateTab("Main")
local Sector1 = Tab:CreateSector("Player","left")
local loop = false
Sector1:AddToggle("Loop",false,function(t)
loop = t
end)
Sector1:AddSlider("MaxStamina",0,100,1000,1,function(x)
    if loop == true then
        while loop == true do
            print("MaxStamina:"..x)
            char.Humanoid.StaminaMax.Value = x
            wait()
        end
    else
        print("MaxStamina:"..x)
        char.Humanoid.StaminaMax.Value = x
    end
end)
Sector1:AddSlider("Stamina",0,100,1000,1,function(y)
    if loop == true then
        while loop == true do
            print("Stamina:"..y)
            char.Humanoid.Stamina.Value = y
            wait()
        end
    else
        print("Stamina:"..y)
        char.Humanoid.Stamina.Value = y
    end
end)
local Tab2 = CenterHubNo1:CreateTab("Config")
Tab2:CreateConfigSystem()
