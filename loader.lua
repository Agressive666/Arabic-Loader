local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local username = player.Name

local URL = "https://arabic-loader.cadn-gta.workers.dev/?username=" .. username

local success, source = pcall(function()
    return game:HttpGet(URL)
end)

if not success then
    warn("Arabic Loader: erro ao conectar ao servidor.")
    return
end

-- Usuário não autorizado
if source == "WHITELIST_ERROR" then
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "🔒 Arabic Loader",
            Text = "Você não está na whitelist!",
            Duration = 6
        })
    end)

    return
end

-- Carrega o script autorizado
local func, err = loadstring(source)

if not func then
    warn("Arabic Loader: erro ao carregar o script:", err)
    return
end

func()
