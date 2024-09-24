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

-- Função para detectar o mar em que o jogador está no Blox Fruits
local function getCurrentSea()
    if workspace:FindFirstChild("Sea3") then
        return 3 -- Terceiro Mar
    elseif workspace:FindFirstChild("Sea2") then
        return 2 -- Segundo Mar
    else
        return 1 -- Primeiro Mar
    end
end

-- Função principal para o Blox Fruits, adaptada para funcionar em todos os mares
local function bloxFruitsScript()
    local currentSea = getCurrentSea()

    if currentSea == 1 then
        -- Código específico para o Primeiro Mar
        print("Você está no Primeiro Mar.")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/blox.lua"))()
    elseif currentSea == 2 then
        -- Código específico para o Segundo Mar
        print("Você está no Segundo Mar.")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/blox.lua"))()
    elseif currentSea == 3 then
        -- Código específico para o Terceiro Mar
        print("Você está no Terceiro Mar.")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/blox.lua"))()
    end
end

-- Função para inicializar o sistema de chaves do Rayfield
local Window = Rayfield:CreateWindow({
    Name = "QFB Key System",
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Sirius",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil, -- Criar uma pasta personalizada para o seu hub/jogo
        FileName = "Big Hub"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink", -- O código de convite do Discord, sem incluir discord.gg/. Ex: discord.gg/ABCD seria apenas ABCD
        RememberJoins = true -- Definir como false para forçar o usuário a ingressar no Discord toda vez que carregar
    },
    KeySystem = true, -- Habilitar o sistema de chave
    KeySettings = {
        Title = "QFB",
        Subtitle = "Key System",
        Note = "Copiado para o teclado",
        FileName = "Key", -- Usar um nome único para evitar que outros scripts sobrescrevam o arquivo da chave
        SaveKey = true, -- A chave será salva, mas se for alterada, o usuário não poderá mais usar o script
        GrabKeyFromSite = false, -- Definir como true para pegar a chave de um site RAW
        Key = {"QFB"} -- Lista de chaves aceitas pelo sistema
    }
})

-- Executar o script apropriado com base no jogo
if isBloxFruits() then
    bloxFruitsScript()
elseif isPrisonLife() then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/prision.lua"))()
else
    -- Executar script de suporte se não estiver em um jogo suportado
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/support.lua"))()
end
