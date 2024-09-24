local gameId = game.PlaceId

if gameId == 2753915549 then
    -- Executa o script para Blox Fruits
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/blox.lua"))()
elseif gameId == 155615604 then
    -- Executa o script para Prison Life
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/prision.lua"))()
else
    -- Executa o script de suporte para outros jogos
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/support.lua"))()
end
