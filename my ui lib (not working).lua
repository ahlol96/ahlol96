-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local MainFrame = Instance.new("Frame")
local Tab = Instance.new("Frame")
local Section = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local Title = Instance.new("TextLabel")
local Label = Instance.new("TextLabel")
local Button = Instance.new("TextButton")
local TabOpener = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Background.Name = "Background"
Background.Parent = ScreenGui
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.342823118, 0, 0.0552283749, 0)
Background.Size = UDim2.new(0, 615, 0, 915)

MainFrame.Name = "MainFrame"
MainFrame.Parent = Background
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.0119794011, 0, 0.00755149499, 0)
MainFrame.Size = UDim2.new(0, 600, 0, 900)

Tab.Name = "Tab"
Tab.Parent = MainFrame
Tab.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
Tab.BorderSizePixel = 0
Tab.Size = UDim2.new(0, 599, 0, 900)

Section.Name = "Section"
Section.Parent = Tab
Section.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
Section.BorderSizePixel = 0
Section.Position = UDim2.new(0, 0, 0.0333333313, 0)
Section.Size = UDim2.new(0, 200, 0, 50)

UIListLayout.Parent = Section
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

Title.Name = "Title"
Title.Parent = Section
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0, 200, 0, 30)
Title.Font = Enum.Font.Nunito
Title.Text = "Title"
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextStrokeColor3 = Color3.fromRGB(85, 0, 255)
Title.TextStrokeTransparency = 0.000
Title.TextWrapped = true

Label.Name = "Label"
Label.Parent = Section
Label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Label.BackgroundTransparency = 1.000
Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
Label.BorderSizePixel = 0
Label.Size = UDim2.new(0, 200, 0, 50)
Label.Font = Enum.Font.Nunito
Label.TextColor3 = Color3.fromRGB(0, 0, 0)
Label.TextScaled = true
Label.TextSize = 14.000
Label.TextStrokeColor3 = Color3.fromRGB(85, 0, 255)
Label.TextStrokeTransparency = 0.000
Label.TextWrapped = true

Button.Name = "Button"
Button.Parent = Section
Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Button.BackgroundTransparency = 1.000
Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(1.38794112, 0, 4.65555573, 0)
Button.Size = UDim2.new(0, 200, 0, 50)
Button.Font = Enum.Font.Nunito
Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Button.TextScaled = true
Button.TextSize = 14.000
Button.TextStrokeColor3 = Color3.fromRGB(85, 0, 255)
Button.TextStrokeTransparency = 0.000
Button.TextWrapped = true

TabOpener.Name = "TabOpener"
TabOpener.Parent = Tab
TabOpener.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TabOpener.BackgroundTransparency = 1.000
TabOpener.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabOpener.BorderSizePixel = 0
TabOpener.Size = UDim2.new(0, 200, 0, 30)
TabOpener.Font = Enum.Font.Nunito
TabOpener.Text = "Open Tab"
TabOpener.TextColor3 = Color3.fromRGB(0, 0, 0)
TabOpener.TextScaled = true
TabOpener.TextSize = 14.000
TabOpener.TextStrokeColor3 = Color3.fromRGB(85, 0, 255)
TabOpener.TextStrokeTransparency = 0.000
TabOpener.TextWrapped = true

-- Scripts:

local function TJQTGAC_fake_script() -- TabOpener.LocalScript 
	local script = Instance.new('LocalScript', TabOpener)

	local uis = script.Parent.Parent
	script.Parent.MouseButton1Click:Connect(function()
		for i, v in pairs(uis:GetChildren()) do
			v.Visible = false
		end
		wait(0.05)
		script.Parent.Parent.Visible = true
	end)
end
coroutine.wrap(TJQTGAC_fake_script)()
local function VEIE_fake_script() -- Background.LocalScript 
	local script = Instance.new('LocalScript', Background)

	script.Parent.Draggable = true
end
coroutine.wrap(VEIE_fake_script)()
