local ArrayField = loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/ui.lua'))()
local Window = ArrayField:CreateWindow({
    Name = "QFB|Blox Fruit",
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

local Tab = Window:CreateTab("Auto Farm🤖", 4483362458) -- Title, Image

local Label = Tab:CreateLabel("AVISO!")
local Label = Tab:CreateLabel("Auto Farm não terminado")

local Button = Tab:CreateButton({
   Name = "[Redz Hub]",
   Callback = function()           --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
   -- The function that takes place when the button is pressed
   end,
})

local Tab = Window:CreateTab("Player🧍", 4483362458) -- Title, Image

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local block = Instance.new("Part") -- Cria um novo bloco
block.Size = Vector3.new(7, 1, 7) -- Tamanho do bloco
block.Anchored = true -- O bloco não se moverá devido à gravidade
block.Color = Color3.new(0, 1, 0) -- Cor verde
block.Parent = workspace -- Adiciona o bloco ao workspace

local isActive = false -- Variável para controle do estado do toggle

local Toggle = Tab:CreateToggle({
    Name = "Andar sobre Agua",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag é o identificador para o arquivo de configuração
    Callback = function(Value)
        isActive = Value -- Atualiza o estado com base no valor do toggle
        if not Value then
            block.Position = Vector3.new(0, -10, 0) -- Move o bloco para fora da vista quando desativado
        end
    end,
})

-- Loop para mover o bloco
game:GetService("RunService").Heartbeat:Connect(function()
    if isActive and character and character:FindFirstChild("HumanoidRootPart") then
        local rootPart = character.HumanoidRootPart
        block.Position = Vector3.new(rootPart.Position.X, 1, rootPart.Position.Z) -- Define a posição do bloco na altura 1
    end
end)


 local Slider = Tab:CreateSlider({
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


local Dropdown = Tab:CreateDropdown({
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
