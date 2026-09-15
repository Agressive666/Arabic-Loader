local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local username = player.Name

local URL = "https://arabic-loader.cadn-gta.workers.dev/?username=" .. username

local function notify(title, text)
    task.spawn(function()
        for i = 1, 10 do
            local success = pcall(function()
                StarterGui:SetCore("SendNotification", {
                    Title = title,
                    Text = text,
                    Duration = 6
                })
            end)

            if success then
                return
            end

            task.wait(0.5)
        end
    end)
end

local success, source = pcall(function()
    return game:HttpGet(URL)
end)

if not success then
    local errorMessage = tostring(source)

    warn("Arabic Loader - ERRO:", errorMessage)

    if string.find(errorMessage, "403") then
        notify(
            "🔒 Acesso Negado",
            "Você não está na whitelist!"
        )
    else
        notify(
            "⚠️ Arabic Loader",
            "Erro ao conectar ao servidor."
        )
    end

    return
end

if source == "WHITELIST_ERROR" then
    notify(
        "🔒 Acesso Negado",
        "Você não está na whitelist!"
    )

    return
end

local func, err = loadstring(source)

if not func then
    warn("Arabic Loader - ERRO NO SCRIPT:", err)

    notify(
        "⚠️ Arabic Loader",
        "Erro ao carregar o script."
    )

    return
end

print("Arabic Loader - AUTORIZADO:", username)

func()
