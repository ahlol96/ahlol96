if game.Players.LocalPlayer.PlayerGui:FindFirstChild("MaterialFarmerGui") then
	game.Players.LocalPlayer.PlayerGui:FindFirstChild("MaterialFarmerGui"):Destroy()
end
if game.CoreGui:FindFirstChild("MaterialFarmerGui") then
	game.CoreGui:FindFirstChild("MaterialFarmerGui"):Destroy()
end
local toggle = false
local ScreenGui = Instance.new("ScreenGui")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIStroke = Instance.new("UIStroke")
local UIListLayout = Instance.new("UIListLayout")
local Button = Instance.new("TextButton")
local UIStroke_2 = Instance.new("UIStroke")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScrollingFrame.Parent = ScreenGui
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.410989016, 0, 0.214408234, 0)
ScrollingFrame.Size = UDim2.new(0, 150, 0, 100)
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(85, 0, 255)
UIStroke.Thickness = 3
UIStroke.Parent = ScrollingFrame
UIListLayout.Parent = ScrollingFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 20)
Button.Name = "Button"
Button.Parent = ScrollingFrame
Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Button.BackgroundTransparency = 1.000
Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(0, 0, 0.055555556, 0)
Button.Size = UDim2.new(0, 100, 0, 50)
Button.Font = Enum.Font.Nunito
Button.Text = "Item"
Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Button.TextScaled = true
Button.TextSize = 14.000
Button.TextStrokeColor3 = Color3.fromRGB(85, 0, 255)
Button.TextStrokeTransparency = 0.000
Button.TextWrapped = true
UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_2.Color = Color3.fromRGB(85, 0, 255)
UIStroke_2.Thickness = 1.5
UIStroke_2.Parent = Button
local function JPYWG_fake_script()
	local script = Instance.new('LocalScript', Button)
	script.Parent.MouseButton1Click:Connect(function()
		toggle = not toggle
	end)
end
coroutine.wrap(JPYWG_fake_script)()
while toggle == true do wait()
	for i, v in pairs(game:GetService("Workspace").MaterialGivers:GetDescendants()) do wait()
		if v.Name == "TouchInterest" and v.Parent then wait()
			firetouchinterest(game:GetService("Players").LocalPlayer.Character.Torso, v.Parent, 0)
			wait(0.05)
			firetouchinterest(game:GetService("Players").LocalPlayer.Character.Torso, v.Parent, 1)
		end
	end
end
