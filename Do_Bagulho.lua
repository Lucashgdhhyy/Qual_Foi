local ArrayField = loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/ui.lua'))()
local Window = ArrayField:CreateWindow({
    Name = "QFB|Lista de jogos",
    LoadingTitle = "Carregando...",
    LoadingSubtitle = "by durk,mc_flamingo",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "ArrayField"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key", -- It is recommended to use something unique as other scripts using ArrayField may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like ArrayField to get the key from
       Actions = {
             [1] = {
                 Text = 'Click here to copy the key link <--',
                 OnPress = function()
                     print('Pressed')
                 end,
                 }
             },
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })
local Tab = Window:CreateTab("Suporte", 4483362458) -- Title, Image

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CurrentGame = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

local Paragraph = Tab:CreateParagraph({
    Title = "Este jogo não é suportado", 
    Content = "O jogo " .. CurrentGame .. " não é suportado. Lista dos jogos suportados abaixo."
})


local Paragraph = Tab:CreateParagraph({Title = "Blox Fruit", Content = "V1"})
local Button = Tab:CreateButton({
   Name = "Blox Fruit",
   Callback = function()           loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/blox.lua"))()
   -- The function that takes place when the button is pressed
   end,
})

local Paragraph = Tab:CreateParagraph({Title = "Prision Life", Content = "V0.8"})

local Button = Tab:CreateButton({
   Name = "Prision Life",
   Callback = function()           loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/prision.lua"))()
   -- The function that takes place when the button is pressed
   end,
})

local Paragraph = Tab:CreateParagraph({Title = "Doors", Content = "não terminado"})

local Button = Tab:CreateButton({
   Name = "Doors",
   Callback = function()           
   -- The function that takes place when the button is pressed
   end,
})
