local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local username = player.Name

local URL = "https://arabic-loader.cadn-gta.workers.dev/"

local success, source = pcall(function()
    return request({
        Url = URL,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode({
            username = username
        })
    }).Body
end)

if not success then
    warn("Arabic Loader - erro HTTP:", source)
    return
end

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

local func, err = loadstring(source)

if not func then
    warn("Arabic Loader - erro:", err)
    return
end

func()
