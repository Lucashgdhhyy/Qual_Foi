local gameId = game.PlaceId

if gameId == 2753915549 then -- Blox Fruits (inclui Third Sea)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/blox.lua"))()
elseif gameId == 155615604 then -- Prison Life
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/prision.lua"))()
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucashgdhhyy/Qual_Foi/refs/heads/main/support.lua"))()
end
