getgenv().enabled = true --Toggle on/off
getgenv().uselocalplayer = false --Choose whether the ESP highlights LocalPlayer or not
getgenv().outlinehealthcolor = true
getgenv().filluseteamcolor = false --Toggle fill color using player team color on/off
getgenv().outlineuseteamcolor = false --Toggle outline color using player team color on/off
getgenv().fillcolor = Color3.new(0, 0, 0) --Change fill color, no need to edit if using team color
getgenv().outlinecolor = Color3.new(0,0,0) --Change outline color, no need to edit if using team color
getgenv().filltrans = 1 --Change fill transparency
getgenv().outlinetrans = 0 --Change outline transparency

loadstring(game:HttpGet("https://raw.githubusercontent.com/ahlol96/ahlol96/main/highlightlib.lua"))()
