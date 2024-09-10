local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Qual foi do bagulho", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Discord",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab = Window:MakeTab({
	Name = "Blox fruit",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Redz Hub",
	Callback = function()
      		print("button pressed")  loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()

  	end    
})
Tab:AddButton({
	Name = "W-Azure",
	Callback = function()
      		print("button pressed")  loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()

  	end    
})


Tab:AddButton({
	Name = "Cokka",
	Callback = function()
      		print("button pressed")  loadstring(game:HttpGet"https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua")()

  	end    
})


Tab:AddButton({
	Name = "Tbao",
	Callback = function()
      		print("button pressed")  loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubBloxFruit"))()

  	end    
})


Tab:AddButton({
	Name = "HOHO",
	Callback = function()
      		print("button pressed")  loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))()

  	end    
})


Tab:AddButton({
	Name = "Ninja Hub",
	Callback = function()
      		print("button pressed")      loadstring(game:HttpGet("https://raw.githubusercontent.com/Xero2409/NinjaHub/main/ninjahub.lua"))()

  	end    
})


Tab:AddButton({
	Name = "Banana",
	Callback = function()
      		print("button pressed")               loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaCat-kaitunBF.lua"))()

  	end    
})

orionlib:Init()
