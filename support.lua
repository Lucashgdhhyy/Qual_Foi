
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/ui.lua'))()
local Window = Rayfield:CreateWindow({
   Name = "QFB|Suporte list",
   LoadingTitle = "Carregando...",
   LoadingSubtitle = "by durk,mc_flamingo",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
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
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
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

local Paragraph = Tab:CreateParagraph({Title = "Prision Life", Content = "V0.8"})

local Paragraph = Tab:CreateParagraph({Title = "Doors", Content = "não terminado"})


local Tab = Window:CreateTab("Universal", 4483362458) -- Title, Image

local RunService = game:GetService("RunService")

-- Função para criar um bloco colorido e o nome/vida em cima dos Humanoids de outros jogadores
local function createBoxAndInfoForHumanoids()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") and player.Team then
                -- Cria a caixa colorida
                local teamColor = player.TeamColor.Color
                local box = Instance.new("BoxHandleAdornment")
                box.Adornee = character.HumanoidRootPart
                box.Size = Vector3.new(4, 6, 4)
                box.Color3 = teamColor
                box.Transparency = 0.5
                box.AlwaysOnTop = true
                box.ZIndex = 10
                box.Parent = character.HumanoidRootPart
                box.Name = "TeamBox"

                -- Cria o BillboardGui para o nome, distância e vida
                local billboardGui = Instance.new("BillboardGui")
                billboardGui.Adornee = character.HumanoidRootPart
                billboardGui.Size = UDim2.new(0, 200, 0, 50)
                billboardGui.StudsOffset = Vector3.new(0, 3, 0)
                billboardGui.AlwaysOnTop = true
                billboardGui.Name = "PlayerInfo"

                -- Cria o TextLabel para o nome do jogador
                local nameLabel = Instance.new("TextLabel")
                nameLabel.Text = player.Name
                nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
                nameLabel.BackgroundTransparency = 1
                nameLabel.TextColor3 = Color3.new(1, 1, 1)
                nameLabel.Font = Enum.Font.SourceSansBold
                nameLabel.TextScaled = true
                nameLabel.Parent = billboardGui

                -- Cria o Frame para mostrar a barra de vida
                local healthBarFrame = Instance.new("Frame")
                healthBarFrame.Size = UDim2.new(1, 0, 0.25, 0)
                healthBarFrame.Position = UDim2.new(0, 0, 0.5, 0)
                healthBarFrame.BackgroundTransparency = 0.3
                healthBarFrame.BackgroundColor3 = Color3.new(1, 0, 0) -- Cor da barra de vida (vermelho)
                healthBarFrame.Parent = billboardGui

                -- Cria o preenchimento da barra de vida
                local healthFill = Instance.new("Frame")
                healthFill.BackgroundColor3 = Color3.new(0, 1, 0) -- Verde para a vida
                healthFill.Size = UDim2.new(1, 0, 1, 0) -- Inicialmente cheio
                healthFill.Name = "HealthFill"
                healthFill.Parent = healthBarFrame

                -- Adiciona o BillboardGui à HumanoidRootPart
                billboardGui.Parent = character.HumanoidRootPart

                -- Variável para controlar o tempo
                local timeElapsed = 0
                
                -- Atualiza a barra de vida e a distância
                RunService.Heartbeat:Connect(function(deltaTime)
                    timeElapsed = timeElapsed + deltaTime
                    if timeElapsed >= 0.001 then
                        if character and character:FindFirstChild("Humanoid") then
                            local humanoid = character:FindFirstChild("Humanoid")

                            -- Atualiza a barra de vida com base na vida atual do jogador
                            local healthPercent = humanoid.Health / humanoid.MaxHealth
                            healthFill.Size = UDim2.new(healthPercent, 0, 1, 0)

                            -- Calcula a distância entre o jogador local e o jogador alvo
                            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - character.HumanoidRootPart.Position).Magnitude
                            nameLabel.Text = string.format("%s (%.0f studs)", player.Name, distance)
                        end
                        -- Reseta o contador de tempo
                        timeElapsed = 0
                    end
                end)
            end
        end
    end
end
