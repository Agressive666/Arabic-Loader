local Players = game:GetService("Players")

local player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local username = player.Name

print("Usuario detectado:", username)

local URL = "https://arabic-loader.cadn-gta.workers.dev/?username=" .. username

local success, response = pcall(function()
    return game:HttpGet(URL)
end)

print("HTTP:", success)
print("Resposta:", response)

if not success then
    warn("Erro:", response)
    return
end

if response == "WHITELIST_ERROR" then
    print("NAO AUTORIZADO")
    return
end

print("AUTORIZADO")
