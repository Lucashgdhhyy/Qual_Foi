if not game:IsLoaded() then
    game.Loaded:Wait()
end

local v = game:GetService("VirtualInputManager")
local s = Instance.new("ScreenGui")
s.Parent = game.CoreGui

local b = Instance.new("TextButton")
b.Size = UDim2.new(0, 200, 0, 50)
b.Position = UDim2.new(1, -210, 0, 10) -- Posição fixa no canto superior direito
b.AnchorPoint = Vector2.new(1, 0)
b.BackgroundColor3 = Color3.new(0, 0, 0)
b.BorderSizePixel = 0 -- Remove a borda padrão
b.Text = "Spam Manual!"
b.TextColor3 = Color3.new(1, 1, 1)
b.TextScaled = true
b.Font = Enum.Font.LuckiestGuy
b.TextXAlignment = Enum.TextXAlignment.Center
b.TextYAlignment = Enum.TextYAlignment.Center
b.Parent = s

-- Adiciona um UIStroke para criar a borda RGB
local border = Instance.new("UIStroke")
border.Color3 = Color3.new(1, 0, 0) -- Começa com vermelho
border.Thickness = 5 -- Espessura da borda
border.Parent = b

local t = false
b.MouseButton1Click:Connect(function()
    t = not t
    b.Text = t and "Desligar?" or "Ligar?"
    while t do
        v:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        wait()
    end
end)

-- Função para mudar a cor da borda para RGB
local function updateBorderColor()
    while true do
        for i = 0, 1, 0.01 do
            border.Color3 = Color3.fromHSV(i, 1, 1) -- Altera a cor da borda
            wait(0.1) -- Ajuste o tempo para a velocidade desejada
        end
    end
end

-- Inicia a atualização da cor da borda
updateBorderColor()

local d
local i
local ds
local sp

-- A função para mover o botão foi removida, pois não queremos que ele seja movível.

b.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        d = true
        ds = input.Position
        sp = b.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                d = false
            end
        end)
    end
end)

b.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        i = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if d and input == i then
        -- A movimentação do botão foi removida.
    end
end)
