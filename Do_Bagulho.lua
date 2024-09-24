local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Função para detectar se o jogo é Blox Fruits
local function isBloxFruits()
    return game.PlaceId == 2753915549
end

-- Função para detectar se o jogo é Prison Life
local function isPrisonLife()
    return game.PlaceId == 155615604
end

-- Executar o script apropriado com base no jogo
if isBloxFruits() then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/blox.lua"))()
elseif isPrisonLife() then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/prision.lua"))()
else
    -- Executar script de suporte se não estiver em um jogo suportado
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/support.lua"))()
end
