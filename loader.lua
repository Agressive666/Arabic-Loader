local URL = "https://arabic-loader.cadn-gta.workers.dev/"

local success, source = pcall(function()
    return game:HttpGet(URL)
end)

if not success then
    warn("Erro ao baixar o script:", source)
    return
end

local func, err = loadstring(source)

if not func then
    warn("Erro ao carregar o script:", err)
    return
end

func()
