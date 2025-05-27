--ts from an open source esp library, just modified for blackout & for my script
local rs = cloneref(game:GetService("ReplicatedStorage"))
local ps = cloneref(game:GetService("Players"))
local workspace = cloneref(game:GetService("Workspace"))
local idb = require(rs.Mods.ItemDatabase)
local tdb = require(rs.Mods.TypeDatabase)
local RotationAngle, Tick = -45, tick()
local cam = workspace.CurrentCamera
local lp = ps.LocalPlayer

function Fade(element, distance)
	local transparency = math.max(0.1, 1 - (distance / ESP.MaxDistance))
	if element:IsA("TextLabel") then
		element.TextTransparency = 1 - transparency
	elseif element:IsA("ImageLabel") then
		element.ImageTransparency = 1 - transparency
	elseif element:IsA("UIStroke") then
		element.Transparency = 1 - transparency
	elseif element:IsA("Frame") and (element.Name == "Healthbar" or element.Name == "BehindHealthbar") then
		element.BackgroundTransparency = 1 - transparency
	elseif element:IsA("Frame") then
		element.BackgroundTransparency = 1 - transparency
	elseif element:IsA("Highlight") then
		element.FillTransparency = 1 - transparency
		element.OutlineTransparency = 1 - transparency
	end
end

function ESPCreate(Class, Properties)
	local _Instance
	if Properties.Parent:FindFirstChild(Properties.Name) then
		_Instance = Properties.Parent:FindFirstChild(Properties.Name)
	else
		_Instance = Instance.new(Class)
	end
	for Property, Value in pairs(Properties) do
		task.wait()
		_Instance[Property] = Value
	end
	return _Instance;
end

local LootGUI = {
	BG = Instance.new("BillboardGui"),
	UIGL = Instance.new("UIGridLayout"),
	TL = Instance.new("TextLabel"),
	UIS = Instance.new("UIStroke"),
	UIC = Instance.new("UICorner"),
	Shine = Instance.new("ImageLabel"),
	Icon = Instance.new("ImageLabel"),
}

LootGUI.BG.Name = "BG"
LootGUI.BG.AlwaysOnTop = true
LootGUI.BG.Size = UDim2.new(20, 0, 20, 0)
LootGUI.BG.StudsOffset = Vector3.new(0, 5, 0)

LootGUI.UIGL.Name = "UIGL"
LootGUI.UIGL.CellSize = UDim2.new(0.2, 0, 0.2, 0)
LootGUI.UIGL.Parent = LootGUI.BG

LootGUI.TL.AnchorPoint = Vector2.new(0.5, 0.5)
LootGUI.TL.ZIndex = 6
LootGUI.TL.Size = UDim2.new(0, 100, 0, 100)
LootGUI.TL.BorderColor3 = Color3.new(0, 0, 0)
LootGUI.TL.BorderSizePixel = 0
LootGUI.TL.BackgroundTransparency = 0.8
LootGUI.TL.Position = UDim2.new(0.7, 0, 0.7, 0)
LootGUI.TL.BackgroundColor3 = Color3.new(0, 0, 0)
LootGUI.TL.TextColor3 = Color3.new(0, 0, 0)
LootGUI.TL.Text = ""

LootGUI.UIS.Name = "UIS"
LootGUI.UIS.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
LootGUI.UIS.Color = Color3.new(1, 1, 1)
LootGUI.UIS.Thickness = 3
LootGUI.UIS.Parent = LootGUI.TL

LootGUI.UIC.Name = "UIC"
LootGUI.UIC.CornerRadius = UDim.new(0, 4)
LootGUI.UIC.Parent = LootGUI.TL

LootGUI.Shine.Name = "Shine"
LootGUI.Shine.AnchorPoint = Vector2.new(0.5, 0.5)
LootGUI.Shine.ZIndex = 0
LootGUI.Shine.Size = UDim2.new(2, 0, 2, 0)
LootGUI.Shine.BorderColor3 = Color3.new(0, 0, 0)
LootGUI.Shine.BorderSizePixel = 0
LootGUI.Shine.BackgroundTransparency = 1
LootGUI.Shine.Position = UDim2.new(0.5, 0, 0.5, 0)
LootGUI.Shine.BackgroundColor3 = Color3.new(0, 0, 0)
LootGUI.Shine.ImageColor3 = Color3.new(0, 0, 0)
LootGUI.Shine.ImageTransparency = 0.75
LootGUI.Shine.Image = "rbxassetid://8843864860"
LootGUI.Shine.Parent = LootGUI.TL

LootGUI.Icon.Name = "Icon"
LootGUI.Icon.AnchorPoint = Vector2.new(0.5, 0.5)
LootGUI.Icon.Size = UDim2.new(0.9, 0, 0.9, 0)
LootGUI.Icon.BorderColor3 = Color3.new(0, 0, 0)
LootGUI.Icon.BorderSizePixel = 0
LootGUI.Icon.BackgroundTransparency = 1
LootGUI.Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
LootGUI.Icon.BackgroundColor3 = Color3.new(0, 0, 0)
LootGUI.Icon.Parent = LootGUI.TL

cloneref(game:GetService("RunService")).RenderStepped:Connect(function()
	if not ESP or not Toggles or not chars then return end
	if ESP.Enabled then
		for i,v in pairs(chars) do
			task.spawn(function()
				local p = ps:GetPlayerFromCharacter(v)
				if p then
					local g = ESPCreate("ScreenGui",{Name = v.Name.."_MAINESP", Enabled = true, Parent = game.CoreGui})
					local Name = ESPCreate("TextLabel", {Name = "Name", Parent = g, Position = UDim2.new(0.5, 0, 0, -11), Size = UDim2.new(0, 100, 0, 20), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.Code, TextSize = ESP.FontSize, TextStrokeTransparency = 0, TextStrokeColor3 = Color3.fromRGB(0, 0, 0), RichText = true})
					local Distance = ESPCreate("TextLabel", {Name = "Distance", Parent = g, Position = UDim2.new(0.5, 0, 0, 11), Size = UDim2.new(0, 100, 0, 20), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.Code, TextSize = ESP.FontSize, TextStrokeTransparency = 0, TextStrokeColor3 = Color3.fromRGB(0, 0, 0), RichText = true})
					local Weapon = ESPCreate("TextLabel", {Name = "Weapon", Parent = g, Position = UDim2.new(0.5, 0, 0, 31), Size = UDim2.new(0, 100, 0, 20), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.Code, TextSize = ESP.FontSize, TextStrokeTransparency = 0, TextStrokeColor3 = Color3.fromRGB(0, 0, 0), RichText = true})
					local Box = ESPCreate("Frame", {Name = "Box", Parent = g, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0.75, BorderSizePixel = 0})
					local Gradient1 = ESPCreate("UIGradient", {Name = "Gradient1", Parent = Box, Enabled = ESP.Drawing.Boxes.GradientFill, Color = ColorSequence.new{ColorSequenceKeypoint.new(0, ESP.Drawing.Boxes.GradientFillRGB1), ColorSequenceKeypoint.new(1, ESP.Drawing.Boxes.GradientFillRGB2)}})
					local Outline = ESPCreate("UIStroke", {Name = "Outline", Parent = Box, Enabled = ESP.Drawing.Boxes.Gradient, Transparency = 0, Color = Color3.fromRGB(255, 255, 255), LineJoinMode = Enum.LineJoinMode.Miter})
					local Gradient2 = ESPCreate("UIGradient", {Name = "Gradient2", Parent = Outline, Enabled = ESP.Drawing.Boxes.Gradient, Color = ColorSequence.new{ColorSequenceKeypoint.new(0, ESP.Drawing.Boxes.GradientRGB1), ColorSequenceKeypoint.new(1, ESP.Drawing.Boxes.GradientRGB2)}})
					local Healthbar = ESPCreate("Frame", {Name = "Healthbar", Parent = g, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0})
					local BehindHealthbar = ESPCreate("Frame", {Name = "BehindHealthbar", Parent = g, ZIndex = -1, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0})
					local HealthbarGradient = ESPCreate("UIGradient", {Name = "HealthbarGradient", Parent = Healthbar, Enabled = ESP.Drawing.Healthbar.Gradient, Rotation = -90, Color = ColorSequence.new{ColorSequenceKeypoint.new(0, ESP.Drawing.Healthbar.GradientRGB1), ColorSequenceKeypoint.new(0.5, ESP.Drawing.Healthbar.GradientRGB2), ColorSequenceKeypoint.new(1, ESP.Drawing.Healthbar.GradientRGB3)}})
					local HealthText = ESPCreate("TextLabel", {Name = "HealthText", Parent = g, Position = UDim2.new(0.5, 0, 0, 31), Size = UDim2.new(0, 100, 0, 20), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.Code, TextSize = ESP.FontSize, TextStrokeTransparency = 0, TextStrokeColor3 = Color3.fromRGB(0, 0, 0)})
					local Highlight = ESPCreate("Highlight", {Name = "Highlight", Parent = g, FillTransparency = 1, OutlineTransparency = 0, OutlineColor = Color3.fromRGB(119, 120, 255), DepthMode = "AlwaysOnTop"})
					local LeftTop = ESPCreate("Frame", {Name = "LeftTop", Parent = g, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
					local LeftSide = ESPCreate("Frame", {Name = "LeftSide", Parent = g, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
					local RightTop = ESPCreate("Frame", {Name = "RightTop", Parent = g, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
					local RightSide = ESPCreate("Frame", {Name = "RightSide", Parent = g, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
					local BottomSide = ESPCreate("Frame", {Name = "BottomSide", Parent = g, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
					local BottomDown = ESPCreate("Frame", {Name = "BottomDown", Parent = g, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
					local BottomRightSide = ESPCreate("Frame", {Name = "BottomRightSide", Parent = g, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})
					local BottomRightDown = ESPCreate("Frame", {Name = "BottomRightDown", Parent = g, BackgroundColor3 = ESP.Drawing.Boxes.Corner.RGB, Position = UDim2.new(0, 0, 0, 0)})


					local function HideESP()
						Box.Visible = false
						Name.Visible = false
						Distance.Visible = false
						Weapon.Visible = false
						Healthbar.Visible = false
						BehindHealthbar.Visible = false
						HealthText.Visible = false
						LeftTop.Visible = false
						LeftSide.Visible = false
						BottomSide.Visible = false
						BottomDown.Visible = false
						RightTop.Visible = false
						RightSide.Visible = false
						BottomRightSide.Visible = false
						BottomRightDown.Visible = false
						Highlight.Enabled = false
					end


					if v and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildOfClass("Humanoid") then
						local HRP = v.HumanoidRootPart
						local Humanoid = v:FindFirstChildOfClass("Humanoid")
						local Pos, OnScreen = cam:WorldToScreenPoint(HRP.Position)
						local Dist = (cam.CFrame.Position - HRP.Position).Magnitude

						if OnScreen and Dist <= ESP.MaxDistance then
							local Size = HRP.Size.Y
							local scaleFactor = (Size * cam.ViewportSize.Y) / (Pos.Z * 2)
							local w, h = 3 * scaleFactor, 4.5 * scaleFactor

							if ESP.FadeOut.OnDistance then
								Fade(Box, Dist)
								Fade(Outline, Dist)
								Fade(Name, Dist)
								Fade(Distance, Dist)
								Fade(Weapon, Dist)
								Fade(Healthbar, Dist)
								Fade(BehindHealthbar, Dist)
								Fade(HealthText, Dist)
								Fade(LeftTop, Dist)
								Fade(LeftSide, Dist)
								Fade(BottomSide, Dist)
								Fade(BottomDown, Dist)
								Fade(RightTop, Dist)
								Fade(RightSide, Dist)
								Fade(BottomRightSide, Dist)
								Fade(BottomRightDown, Dist)
								Fade(Highlight, Dist)
							end


							Highlight.Adornee = v
							Highlight.Enabled = ESP.Drawing.Highlight.Enabled
							Highlight.FillColor = ESP.Drawing.Highlight.FillRGB
							Highlight.OutlineColor = ESP.Drawing.Highlight.OutlineRGB
							Highlight.FillTransparency = ESP.Drawing.Highlight.Fill_Transparency * 0.01
							Highlight.OutlineTransparency = ESP.Drawing.Highlight.Outline_Transparency * 0.01
							if ESP.Drawing.Highlight.Thermal then
								local breathe_effect = math.atan(math.sin(tick() * 2)) * 2 / math.pi
								Highlight.FillTransparency = ESP.Drawing.Highlight.Fill_Transparency * breathe_effect * 0.01
								Highlight.OutlineTransparency = ESP.Drawing.Highlight.Outline_Transparency * breathe_effect * 0.01
							end
							if ESP.Drawing.Highlight.VisibleCheck then
								Highlight.DepthMode = Enum.HighlightDepthMode.Occluded
							else
								Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
							end

							LeftTop.Visible = ESP.Drawing.Boxes.Corner.Enabled
							LeftTop.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y - h / 2)
							LeftTop.Size = UDim2.new(0, w / 5, 0, 1)

							LeftSide.Visible = ESP.Drawing.Boxes.Corner.Enabled
							LeftSide.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y - h / 2)
							LeftSide.Size = UDim2.new(0, 1, 0, h / 5)

							BottomSide.Visible = ESP.Drawing.Boxes.Corner.Enabled
							BottomSide.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y + h / 2)
							BottomSide.Size = UDim2.new(0, 1, 0, h / 5)
							BottomSide.AnchorPoint = Vector2.new(0, 5)

							BottomDown.Visible = ESP.Drawing.Boxes.Corner.Enabled
							BottomDown.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y + h / 2)
							BottomDown.Size = UDim2.new(0, w / 5, 0, 1)
							BottomDown.AnchorPoint = Vector2.new(0, 1)

							RightTop.Visible = ESP.Drawing.Boxes.Corner.Enabled
							RightTop.Position = UDim2.new(0, Pos.X + w / 2, 0, Pos.Y - h / 2)
							RightTop.Size = UDim2.new(0, w / 5, 0, 1)
							RightTop.AnchorPoint = Vector2.new(1, 0)

							RightSide.Visible = ESP.Drawing.Boxes.Corner.Enabled
							RightSide.Position = UDim2.new(0, Pos.X + w / 2 - 1, 0, Pos.Y - h / 2)
							RightSide.Size = UDim2.new(0, 1, 0, h / 5)
							RightSide.AnchorPoint = Vector2.new(0, 0)

							BottomRightSide.Visible = ESP.Drawing.Boxes.Corner.Enabled
							BottomRightSide.Position = UDim2.new(0, Pos.X + w / 2, 0, Pos.Y + h / 2)
							BottomRightSide.Size = UDim2.new(0, 1, 0, h / 5)
							BottomRightSide.AnchorPoint = Vector2.new(1, 1)

							BottomRightDown.Visible = ESP.Drawing.Boxes.Corner.Enabled
							BottomRightDown.Position = UDim2.new(0, Pos.X + w / 2, 0, Pos.Y + h / 2)
							BottomRightDown.Size = UDim2.new(0, w / 5, 0, 1)
							BottomRightDown.AnchorPoint = Vector2.new(1, 1)



							Box.Position = UDim2.new(0, Pos.X - w / 2, 0, Pos.Y - h / 2)
							Box.Size = UDim2.new(0, w, 0, h)
							Box.Visible = ESP.Drawing.Boxes.Full.Enabled


							if ESP.Drawing.Boxes.Filled.Enabled then
								Box.BackgroundColor3 = ESP.Drawing.Boxes.Filled.RGB
								if ESP.Drawing.Boxes.GradientFill then
									Box.BackgroundTransparency = ESP.Drawing.Boxes.Filled.Transparency
								else
									Box.BackgroundTransparency = 1
								end
								Box.BorderSizePixel = 1
							else
								Box.BackgroundTransparency = 1
							end

							RotationAngle = RotationAngle + (tick() - Tick) * ESP.Drawing.Boxes.RotationSpeed * math.cos(math.pi / 4 * tick() - math.pi / 2)
							if ESP.Drawing.Boxes.Animate then
								Gradient1.Rotation = RotationAngle
								Gradient2.Rotation = RotationAngle
							else
								Gradient1.Rotation = -45
								Gradient2.Rotation = -45
							end
							Tick = tick()


							local health = Humanoid.Health / Humanoid.MaxHealth
							Healthbar.Visible = ESP.Drawing.Healthbar.Enabled
							Healthbar.Position = UDim2.new(0, Pos.X - w / 2 - 6, 0, Pos.Y - h / 2 + h * (1 - health))
							Healthbar.Size = UDim2.new(0, ESP.Drawing.Healthbar.Width, 0, h * health)

							BehindHealthbar.Visible = ESP.Drawing.Healthbar.Enabled
							BehindHealthbar.Position = UDim2.new(0, Pos.X - w / 2 - 6, 0, Pos.Y - h / 2)
							BehindHealthbar.Size = UDim2.new(0, ESP.Drawing.Healthbar.Width, 0, h)


							if ESP.Drawing.Healthbar.HealthText then
								local healthPercentage = math.floor(Humanoid.Health / Humanoid.MaxHealth * 100)
								HealthText.Position = UDim2.new(0, Pos.X - w / 2 - 6, 0, Pos.Y - h / 2 + h * (1 - healthPercentage / 100) + 3)
								HealthText.Text = tostring(healthPercentage)
								HealthText.Visible = Humanoid.Health < Humanoid.MaxHealth
								if ESP.Drawing.Healthbar.Lerp then
									local color = health >= 0.75 and Color3.fromRGB(0, 255, 0) or health >= 0.5 and Color3.fromRGB(255, 255, 0) or health >= 0.25 and Color3.fromRGB(255, 170, 0) or Color3.fromRGB(255, 0, 0)
									HealthText.TextColor3 = color
								else
									HealthText.TextColor3 = ESP.Drawing.Healthbar.HealthTextRGB
								end
							end

							Name.Visible = ESP.Drawing.Names.Enabled
							if friendchecking and lp:IsFriendsWith(p.UserId) then
								Name.Text = string.format('[<font color="rgb(%d, %d, %d)">F</font>] <font color="rgb(%d, %d, %d)">%s</font>', ESP.Options.FriendcheckRGB.R * 255, ESP.Options.FriendcheckRGB.G * 255, ESP.Options.FriendcheckRGB.B * 255, ESP.Drawing.Names.RGB.R * 255, ESP.Drawing.Names.RGB.G * 255, ESP.Drawing.Names.RGB.B * 255, v.Name)
							else
								Name.Text = string.format('[<font color="rgb(%d, %d, %d)">E</font>] <font color="rgb(%d, %d, %d)">%s</font>', 255, 0, 0, ESP.Drawing.Names.RGB.R * 255, ESP.Drawing.Names.RGB.G * 255, ESP.Drawing.Names.RGB.B * 255, v.Name)
							end
							Name.Position = UDim2.new(0, Pos.X, 0, Pos.Y - h / 2 - 9)

							if ESP.Drawing.Distances.Enabled then
								if ESP.Drawing.Distances.Position == "Bottom" then
									Weapon.Position = UDim2.new(0, Pos.X, 0, Pos.Y + h / 2 + 18)
									Distance.Position = UDim2.new(0, Pos.X, 0, Pos.Y + h / 2 + 7)
									Distance.Text = string.format("%d studs", math.floor(Dist))
									Distance.TextColor3 = ESP.Drawing.Distances.RGB
									Distance.Visible = true
								else
									Weapon.Position = UDim2.new(0, Pos.X, 0, Pos.Y + h / 2 + 8)
									Distance.Visible = false
									Name.Text = Name.Text .. string.format(' <font color="rgb(%d, %d, %d)">%dm</font>', ESP.Drawing.Distances.RGB.R * 255, ESP.Drawing.Distances.RGB.G * 255, ESP.Drawing.Distances.RGB.B * 255, math.floor(Dist))
									Name.Visible = ESP.Drawing.Names.Enabled
								end
							end

							if v:FindFirstChild("CurrentGear") and #v:FindFirstChild("CurrentGear"):GetChildren() > 0 and v:FindFirstChild("Head") and ESP.Drawing.ArmorEnabled then
								local b
								if v.Head:FindFirstChildOfClass("BillboardGui") then
									b = v.Head:FindFirstChildOfClass("BillboardGui")
								else
									b = LootGUI.BG:Clone()
								end
								b.Enabled = true
								b.Adornee = v.Head
								b.Parent = v.Head
								for eax,ea in pairs(b:GetChildren()) do
									if ea:IsA("TextLabel") then
										ea:Destroy()
									end
								end
								for eaw,ea in pairs(v:FindFirstChild("CurrentGear"):GetChildren()) do
									if idb[ea.Name] and idb[ea.Name]["Type"] and tdb[idb[ea.Name]["Type"]]["Color"] then
										local current = LootGUI.TL:Clone()
										current.Icon.Image = idb[ea.Name].Icon
										current.Icon.BackgroundColor3 = tdb[idb[ea.Name]["Type"]]["Color"]
										current.Shine.ImageColor3 = tdb[idb[ea.Name]["Type"]]["Color"]
										current.Shine.BackgroundColor3 = tdb[idb[ea.Name]["Type"]]["Color"]
										current.UIS.Color = tdb[idb[ea.Name]["Type"]]["Color"]
										current.Parent = b
									end
								end
							elseif v:FindFirstChild("Head") and v.Head:FindFirstChildOfClass("BillboardGui") and not ESP.Drawing.ArmorEnabled then
								v.Head:FindFirstChildOfClass("BillboardGui").Enabled = false
							end

							if ESP.Bounty then
								Name.Text = Name.Text.." "..string.format('<font color="rgb(%d, %d, %d)">%s</font>', ESP.BountyRGB.R * 255, ESP.BountyRGB.G * 255, ESP.BountyRGB.B * 255, tostring(p:GetAttribute("Bounty")).."$")
							end

							Weapon.TextColor3 = ESP.Drawing.Weapons.WeaponTextRGB
							Weapon.Visible = ESP.Drawing.Weapons.Enabled
							if v:FindFirstChildOfClass("RayValue") then
								Weapon.Text = v:FindFirstChildOfClass("RayValue").Name
							else
								Weapon.Text = ""
							end
						else
							HideESP()
						end
					else
						HideESP()
					end
				end
			end)
		end
	else
		for i,v in pairs(game.CoreGui:GetChildren()) do
			if string.find(v.Name,"_MAINESP") then
				v.Enabled = false
			end
		end
	end
	for i,v in pairs(game.CoreGui:GetChildren()) do
		if string.find(v.Name,"_MAINESP") and not workspace.Chars:FindFirstChild((string.gsub(v.Name,"_MAINESP",""))) then
			v:Destroy()
		end
	end
	if Toggles.Noclip and Toggles.Noclip.Value and lp.Character then
		for i,v in pairs(lp.Character:GetDescendants()) do
			if v:IsA("BasePart") and v.CanCollide == true then
				v.CanCollide = false
			end
		end
	end
end)
