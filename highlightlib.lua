local holder = game.CoreGui:FindFirstChild("ESPHolder") or Instance.new("Folder")
if enabled == false then
	holder:Destroy()
end

if holder.Name == "Folder" then
	holder.Name = "ESPHolder"
	holder.Parent = game.CoreGui
end

if uselocalplayer == false and holder:FindFirstChild(game.Players.LocalPlayer.Name) then
	holder:FindFirstChild(game.Players.LocalPlayer.Name):Destroy()
end

if getgenv().enabled == true then 
	getgenv().enabled = false
	getgenv().enabled = true
end
while getgenv().enabled do
	task.wait()
	for _,v in pairs(game.Players:GetChildren()) do
		local chr = v.Character
		if chr ~= nil then
			local esp = holder:FindFirstChild(v.Name) or Instance.new("Highlight")
			esp.Name = v.Name
			if uselocalplayer == false and esp.Name == game.Players.LocalPlayer.Name then
			else
				esp.Parent = holder
				if filluseteamcolor then
					esp.FillColor = v.TeamColor.Color
				else
					esp.FillColor = fillcolor 
				end
				if outlineuseteamcolor then
					esp.OutlineColor = v.TeamColor.Color
				elseif outlinehealthcolor then
					if chr:FindFirstChild("Humanoid").Health >= 100 then 
						esp.OutlineColor = Color3.new(0, 1, 0)
					end
					if chr:FindFirstChild("Humanoid").Health >= 80 and chr:FindFirstChild("Humanoid").Health <= 99 then 
						esp.OutlineColor = Color3.new(0, 0.65098, 0)
					end
					if chr:FindFirstChild("Humanoid").Health >= 60 and chr:FindFirstChild("Humanoid").Health <= 79 then 
						esp.OutlineColor = Color3.new(0, 0.392157, 0)
					end
					if chr:FindFirstChild("Humanoid").Health >= 40 and chr:FindFirstChild("Humanoid").Health <= 59 then 
						esp.OutlineColor = Color3.new(1, 0.333333, 0)
					end
					if chr:FindFirstChild("Humanoid").Health >= 0 and chr:FindFirstChild("Humanoid").Health <= 39 then 
						esp.OutlineColor = Color3.new(1, 0, 0)
					end
				else
					esp.OutlineColor = outlinecolor
				end
				esp.FillTransparency = filltrans
				esp.OutlineTransparency = outlinetrans
				esp.Adornee = chr
				esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			end
		end
	end
end
