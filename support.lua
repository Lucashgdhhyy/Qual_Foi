-- Supondo que OrionLib esteja carregado
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Teams = game:GetService("Teams")
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

                -- Atualiza a barra de vida e a distância a cada frame
                RunService.RenderStepped:Connect(function()
                    if character and character:FindFirstChild("Humanoid") then
                        local humanoid = character:FindFirstChild("Humanoid")

                        -- Atualiza a barra de vida com base na vida atual do jogador
                        local healthPercent = humanoid.Health / humanoid.MaxHealth
                        healthFill.Size = UDim2.new(healthPercent, 0, 1, 0)

                        -- Calcula a distância entre o jogador local e o jogador alvo
                        local distance = (LocalPlayer.Character.HumanoidRootPart.Position - character.HumanoidRootPart.Position).Magnitude
                        nameLabel.Text = string.format("%s (%.0f studs)", player.Name, distance)
                    end
                end)
            end
        end
    end
end

-- Função para remover os blocos e as informações
local function removeBoxesAndInfo()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local box = character.HumanoidRootPart:FindFirstChild("TeamBox")
                local info = character.HumanoidRootPart:FindFirstChild("PlayerInfo")
                if box then
                    box:Destroy()
                end
                if info then
                    info:Destroy()
                end
            end
        end
    end
end

-- Crie o toggle usando OrionLib
local Toggle = Tab:CreateToggle({
   Name = "Toggle Team Info",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       if Value then
           -- Quando ativado, crie as caixas e as informações
           createBoxAndInfoForHumanoids()
       else
           -- Quando desativado, remova as caixas e as informações
           removeBoxesAndInfo()
       end
   end,
})

-- Função para atualizar as caixas e as informações quando um jogador muda de time
local function onPlayerTeamChanged(player)
    if player ~= LocalPlayer then
        -- Remova qualquer caixa existente e informações
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local box = character.HumanoidRootPart:FindFirstChild("TeamBox")
            local info = character.HumanoidRootPart:FindFirstChild("PlayerInfo")
            if box then
                box:Destroy()
            end
            if info then
                info:Destroy()
            end
        end

        -- Crie uma nova caixa e informações com a nova cor do time
        createBoxAndInfoForHumanoids()
    end
end

-- Conecte os eventos de mudança de time
for _, player in pairs(Players:GetPlayers()) do
    player:GetPropertyChangedSignal("Team"):Connect(function()
        onPlayerTeamChanged(player)
    end)
end

Players.PlayerAdded:Connect(function(player)
    player:GetPropertyChangedSignal("Team"):Connect(function()
        onPlayerTeamChanged(player)
    end)
end)
