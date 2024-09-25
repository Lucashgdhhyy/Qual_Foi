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


local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local jumpCount = 0

local canDoubleJump = false -- Controla se o pulo duplo está ativado

local function onJumpRequest()
    if canDoubleJump then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end

-- Toggle para ativar/desativar o pulo duplo
local Toggle = Tab:CreateToggle({
    Name = "Pulo Duplo Infinito",
    CurrentValue = false,
    Flag = "ToggleDoubleJump",
    Callback = function(Value)
        canDoubleJump = Value
        if not Value then
            jumpCount = 0 -- Reseta o contador de pulo quando o toggle for desativado
        end
    end,
})

-- Verifica quando o jogador pula
UserInputService.JumpRequest:Connect(function()
    if humanoid:GetState() == Enum.HumanoidStateType.Freefall and canDoubleJump then
        jumpCount += 1
        if jumpCount < 150000 then -- Exemplo de limite de 5 pulos
            onJumpRequest()
        else
            jumpCount = 0 -- Reseta após atingir o limite
        end
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


 local Slider = Tab:CreateSlider({
    Name = "Força do Dash",
    Range = {50, 500},  -- O intervalo do slider, de 50 a 500
    Increment = 50,  -- Os incrementos de 50 em 50
    Suffix = "",  -- Não é necessário sufixo, mas pode ser adicionado se desejar
    CurrentValue = 50,  -- Valor inicial
    Flag = "SliderDashLength",  -- Uma flag única para evitar conflitos no arquivo de configuração
    Callback = function(Value)
        -- A função que é chamada quando o valor do slider é alterado
        game.Players.LocalPlayer.Character:SetAttribute("DashLength", Value)
    end,
})
