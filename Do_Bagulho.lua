local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/ui.lua'))()
local Window = Rayfield:CreateWindow({
   Name = "QFB| Blox Fruit",
   LoadingTitle = "Carregando...",
   LoadingSubtitle = "by durk,mc_flamingo",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "QFB UI"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "QFB",
      Subtitle = "Key System",
      Note = "Key System copiada automaticamente",
      FileName = "QFB Assets", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"nothing"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local FarmTab = Window:CreateTab("Auto Farm🤖", 4483362458) -- Title, Image

local Paragraph = FarmTab:CreateParagraph({Title = "Auto Farm", Content = "Não funcionando utilize os scripts de auto farm abaixo!"})

local Section = FarmTab:CreateSection("Scripts de auto farm")

local Button = FarmTab:CreateButton({
   Name = "[Redz Hub]",
   Callback = function()           --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
   -- The function that takes place when the button is pressed
   end,
})

local PlayerTab = Window:CreateTab("Player🧍", 4483362458) -- Title, Image

 local Slider = PlayerTab:CreateSlider({
    Name = "Velocidade",
    Range = {1, 10},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 10,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
     game.Players.LocalPlayer.Character:SetAttribute("SpeedMultiplier", Value)
    end,
 })

local Dropdown = PlayerTab:CreateDropdown({
    Name = "Força do Dash",
    Options = {"50", "100", "150", "200", "250", "300", "350", "400", "450", "500"},
    CurrentOption = {"50"},  -- Valor inicial
    MultipleOptions = false,
    Flag = "DropdownDashLength", -- Uma flag única para evitar conflitos no arquivo de configuração
    Callback = function(Option)
        -- A função que é chamada quando a opção selecionada é alterada
        -- A variável (Option) é uma tabela de strings para as opções atualmente selecionadas
        local Value = tonumber(Option[1])  -- Converte a opção selecionada para número
        game.Players.LocalPlayer.Character:SetAttribute("DashLength", Value)
    end,
})
