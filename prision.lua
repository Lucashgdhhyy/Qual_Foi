local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/ui.lua'))()
local Window = Rayfield:CreateWindow({
   Name = "QFB|Prision Life",
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

local Tab = Window:CreateTab("Mapa🗺️", 4483362458) -- Title, Image

-- Referência ao Workspace
local workspace = game:GetService("Workspace")

-- Criação do botão na interface
local Button = Tab:CreateButton({
    Name = "Deletar Portas",
    Callback = function()
        -- Localizar a parte chamada "Doors"
        local doorsPart = workspace:FindFirstChild("Doors")

        -- Verificar se a parte existe e deletá-la
        if doorsPart then
            doorsPart:Destroy()
            print("A parte 'Doors' foi deletada com sucesso.")
        else
            print("A parte 'Doors' não foi encontrada no Workspace.")
        end
    end,
})

-- Referência ao Workspace
local workspace = game:GetService("Workspace")

-- Criação do botão na interface
local Button = Tab:CreateButton({
    Name = "Pegar todos os items",
    Callback = function()
        -- Referência à parte "giver" dentro de "Prison_ITEMS"
        local prisonItems = workspace:FindFirstChild("Prison_ITEMS")
        local giverPart = prisonItems and prisonItems:FindFirstChild("giver")

        if giverPart then
            -- Iterar sobre todos os itens na parte "giver"
            for _, item in ipairs(giverPart:GetChildren()) do
                if item:IsA("Tool") then  -- Verifica se o item é uma ferramenta (Tool)
                    local player = game.Players.LocalPlayer
                    local character = player.Character or player.CharacterAdded:Wait()
                    local humanoid = character:FindFirstChildOfClass("Humanoid")

                    -- Clonar o item e parentar no Humanoid do jogador
                    local clonedItem = item:Clone()
                    clonedItem.Parent = humanoid:FindFirstChild("Backpack")  -- Adiciona ao Backpack do jogador
                end
            end

            print("Todos os itens foram teleportados para o jogador.")
        else
            print("A parte 'giver' não foi encontrada em 'Prison_ITEMS'.")
        end
    end,
})

local Tab = Window:CreateTab("Player⛹️‍♂️", 4483362458) -- Title, Image

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local Slider = Tab:CreateSlider({
    Name = "Velocidade",
    Range = {0, 100},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16, -- Velocidade padrão no Roblox
    Flag = "Slider1", -- Identificador único para configuração
    Callback = function(Value)
        humanoid.WalkSpeed = Value -- Altera a velocidade do jogador local
    end,
})

-- Define a velocidade inicial do humanoide com o valor atual do slider
humanoid.WalkSpeed = Slider:GetCurrentValue()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Tab = ... -- O objeto do seu Tab deve ser definido corretamente

local Toggle = Tab:CreateToggle({
   Name = "Matar todo mundo",
   CurrentValue = false,
   Flag = "Toggle1", -- Identificador para o arquivo de configuração
   Callback = function(Value)
       if Value then
           -- Ativa o toggle
           for _, player in pairs(Players:GetPlayers()) do
               if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then
                   local targetHumanoid = player.Character.Humanoid
                   local targetPosition = player.Character.HumanoidRootPart.Position

                   -- Teleporta o Humanoid local para o Humanoid do jogador alvo
                   LocalPlayer.Character.HumanoidRootPart.CFrame = targetHumanoid.RootPart.CFrame
                   
                   -- Move suavemente para a nova posição em 5 segundos
                   local tweenInfo = TweenInfo.new(5, Enum.EasingStyle.Linear)
                   local tween = game:GetService("TweenService"):Create(LocalPlayer.Character.HumanoidRootPart, tweenInfo, {Position = targetPosition})
                   tween:Play()

                   -- Aguarda o tween terminar antes de ir para o próximo jogador
                   tween.Completed:Wait()
               end
           end
       end
   end,
})

local Button = Tab:CreateButton({
   Name = "Kill players",
   Callback = function()            while wait () do
  for i, e in pairs(game.Players:GetChildren()) do
                        if e ~= game.Players.LocalPlayer then
                            local meleeEvent = game:GetService("ReplicatedStorage").meleeEvent
                            meleeEvent:FireServer(e)
                            
                        end end end 
   end,
})
