local ArrayField = loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/ui.lua"))()
local Window = ArrayField:CreateWindow({
    Name = "QFB|Doors",
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

local PlayerTab = Window:CreateTab("Player", 4483362458) -- Title, Image

local player = game.Players.LocalPlayer
local humanoid
local speedValue = 12 -- Valor padrão da velocidade
local toggleActive = false
local updateInterval = 0.001 -- Intervalo de atualização em milissegundos
local RunService = game:GetService("RunService")

-- Função para atualizar a velocidade do jogador continuamente
local function updateSpeedContinuously()
    RunService:BindToRenderStep("UpdateSpeed", Enum.RenderPriority.Camera.Value, function()
        if toggleActive and humanoid then
            humanoid.WalkSpeed = speedValue
        end
    end)
end

-- Função para parar a atualização contínua
local function stopSpeedUpdate()
    RunService:UnbindFromRenderStep("UpdateSpeed")
    if humanoid then
        humanoid.WalkSpeed = 12 -- Volta para a velocidade padrão
    end
end

-- Certifique-se de que o jogador esteja pronto ao entrar no jogo
player.CharacterAdded:Connect(function(newCharacter)
    humanoid = newCharacter:WaitForChild("Humanoid")
    humanoid.WalkSpeed = 12 -- Define a velocidade padrão ao entrar no jogo
end)

-- Criação do Toggle para habilitar ou desabilitar a atualização contínua da velocidade
local Toggle = PlayerTab:CreateToggle({
    Name = "Velocidade",
    CurrentValue = false,
    Flag = "SpeedBoost", -- Identificador único para salvar a configuração
    Callback = function(Value)
        toggleActive = Value
        if toggleActive then
            -- Se o toggle for ativado, começa a atualizar a velocidade continuamente
            updateSpeedContinuously()
        else
            -- Quando o toggle for desativado, para a atualização e define a velocidade para o padrão (12)
            stopSpeedUpdate()
        end
    end,
})

-- Criação do Dropdown para selecionar a velocidade
local Dropdown = PlayerTab:CreateDropdown({
    Name = "Selecione a Velocidade",
    Options = {"12", "17", "22", "26", "32"}, -- Opções de velocidade atualizadas
    CurrentOption = "12", -- Velocidade padrão
    MultiSelection = false, -- Permitir seleção única
    Flag = "Dropdown1", -- Identificador único para salvar a configuração
    Callback = function(Option)
        -- A função que será chamada quando a opção selecionada mudar
        speedValue = tonumber(Option) -- Atualiza a velocidade com a opção escolhida

        -- Se o toggle estiver ativado, aplica a nova velocidade imediatamente
        if toggleActive then
            updateSpeedContinuously()
        end
    end,
})

-- Certifique-se de que o humanoid atual seja obtido corretamente
if player.Character and player.Character:FindFirstChild("Humanoid") then
    humanoid = player.Character.Humanoid
    humanoid.WalkSpeed = 12 -- Define a velocidade padrão ao iniciar o jogo
end


local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local toggleActive = false
local updateInterval = 0.001

local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local toggleActive = false
local updateInterval = 0.001

local Toggle = PlayerTab:CreateToggle({
   Name = "Visão Noturna",
   CurrentValue = false,
   Flag = "VisaoNoturnaToggle", -- Certifique-se de que o flag seja único
   Callback = function(Value)
      toggleActive = Value
      if toggleActive then
         -- Remove sombras e ative visão noturna (sem cor verde)
         Lighting.GlobalShadows = false
         Lighting.Brightness = 2 -- Aumenta a luminosidade para simular visão noturna

         -- Atualização constante a cada 0.001 segundos
         RunService:BindToRenderStep("NightVisionUpdate", Enum.RenderPriority.Camera.Value, function()
            if toggleActive then
               Lighting.Brightness = 2
            end
         end)
      else
         -- Restaurar sombras e desativar visão noturna
         RunService:UnbindFromRenderStep("NightVisionUpdate")
         Lighting.GlobalShadows = true
         Lighting.Brightness = 1 -- Valor padrão
      end
   end,
})
