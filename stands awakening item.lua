queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
while true do wait()
    for _, child in ipairs(workspace:GetChildren()) do
        if game.Players.LocalPlayer.Character and child:IsA("BackpackItem") and child:FindFirstChild("Handle") and child.Name ~= "Arrow" and child.Name ~= "Rokakaka Fruit" and child.Name ~= "Frog" and child.Name ~= "DIO's Diary" and child.Name ~= "Ender Pearl" and child.Name ~= "Volcanic Rock" and child.Name ~= "Toxic Chemicals" and child.Name ~= "Samurai Diary" and child.Name ~= "Requiem Arrow" then
            game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):EquipTool(child)
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == "Banknote" then
            v.Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
            v.Parent = game.Players.LocalPlayer.Character
            v:Activate()
        end
    end
end
--local tpcheck = false
game.Players.LocalPlayer.OnTeleport:Connect(function(State)
    --if not tpcheck then
        --tpcheck = true
        queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/ahlol96/stands_awakening/main/item'))()")
    --end
end)
