-- Locals

local ah_lol96_TRR = Instance.new("ScreenGui")
local TimePower = Instance.new("Frame")
local TimeT = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local PowerT = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local UICorner_3 = Instance.new("UICorner")

-- If already executed delete gui and run new gui

if game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("ah_lol96_TR:R") then
	game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("ah_lol96_TR:R"):Destroy()
end
	
if game:GetService("StarterGui"):FindFirstChild("ah_lol96_TR:R") then
	game:GetService("StarterGui"):FindFirstChild("ah_lol96_TR:R"):Destroy()
end

-- GUI

ah_lol96_TRR.Name = "ah_lol96_TR:R"
ah_lol96_TRR.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ah_lol96_TRR.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TimePower.Name = "Time&Power"
TimePower.Parent = ah_lol96_TRR
TimePower.BackgroundColor3 = Color3.fromRGB(70, 0, 255)
TimePower.BorderSizePixel = 0
TimePower.Position = UDim2.new(0.671052635, 0, 0.850483179, 0)
TimePower.Size = UDim2.new(0, 500, 0, 78)
TimePower.Draggable = true

TimeT.Name = "TimeT"
TimeT.Parent = TimePower
TimeT.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TimeT.Position = UDim2.new(0.0600000024, 0, 0.179487184, 0)
TimeT.Size = UDim2.new(0, 200, 0, 50)
TimeT.Font = Enum.Font.Nunito
TimeT.Text = "Time"
TimeT.TextColor3 = Color3.fromRGB(0, 0, 0)
TimeT.TextScaled = true
TimeT.TextSize = 14.000
TimeT.TextStrokeColor3 = Color3.fromRGB(70, 0, 255)
TimeT.TextStrokeTransparency = 0.000
TimeT.TextWrapped = true

UICorner.Parent = TimeT

PowerT.Name = "PowerT"
PowerT.Parent = TimePower
PowerT.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PowerT.Position = UDim2.new(0.540000021, 0, 0.179487184, 0)
PowerT.Size = UDim2.new(0, 200, 0, 50)
PowerT.Font = Enum.Font.Nunito
PowerT.Text = "Power"
PowerT.TextColor3 = Color3.fromRGB(0, 0, 0)
PowerT.TextScaled = true
PowerT.TextSize = 14.000
PowerT.TextStrokeColor3 = Color3.fromRGB(70, 0, 255)
PowerT.TextStrokeTransparency = 0.000
PowerT.TextWrapped = true

UICorner_2.Parent = PowerT

UICorner_3.CornerRadius = UDim.new(0, 9)
UICorner_3.Parent = TimePower

-- Time&Power Values

while true do
	local Time = game:GetService("ReplicatedStorage")["Timer"].Value
	local Power = game:GetService("ReplicatedStorage")["PowerValues"]["PowerLevel"].Value
	PowerT.Text = "Power: " .. tostring(Power)
	TimeT.Text = "Time: " .. tostring(Time)
	wait()
end
-- Time&Power Text
