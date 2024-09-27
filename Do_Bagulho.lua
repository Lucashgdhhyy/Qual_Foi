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
       Note = "O primeiro script hub/script br",
       FileName = "Key", -- It is recommended to use something unique as other scripts using ArrayField may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like ArrayField to get the key from
       Actions = {
             [1] = {
                 Text = 'Clique aqui para copiar a key <--',
                 OnPress = function()
                     print('Pressed')
                 end,
                 }
             },
       Key = {"durk.hts"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })
 local Tab = Window:CreateTab("Game List", 4483362458) -- Title, Image

 local Button = Tab:CreateButton({
   Name = "Blox Fruits V1",
   Interact = 'Click',
   Callback = function()        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/blox.lua"))()
   -- The function that takes place when the button is pressed
   end,
})


local Button = Tab:CreateButton({
   Name = "Prision Life V0.8",
   Interact = 'Click',
   Callback = function()         loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/prision.lua"))()
   -- The function that takes place when the button is pressed
   end,
})

local Button = Tab:CreateButton({
   Name = "Doors V0.2",
   Interact = 'Click',
   Callback = function()               loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/doors.lua"))()
   -- The function that takes place when the button is pressed
   end,
})
