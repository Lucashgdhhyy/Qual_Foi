local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local MarketplaceService = game:GetService("MarketplaceService")

-- Função para detectar se o jogo é Blox Fruits
local function isBloxFruits()
    return game.PlaceId == 2753915549
end

-- Executar o script se o jogo for Blox Fruits
if isBloxFruits() then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/blox.lua"))()
else
    warn("Este script só pode ser executado no Blox Fruits.")
end
