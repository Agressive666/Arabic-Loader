local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local username = player.Name

local URL = "https://arabic-loader.cadn-gta.workers.dev/?username=" .. username

-- ==============================
-- JANELA DE ACESSO NEGADO
-- ==============================

local function showAccessDenied()

    local playerGui = player:WaitForChild("PlayerGui")

    -- Remove janela antiga caso exista
    local oldGui = playerGui:FindFirstChild("ArabicLoaderError")
    if oldGui then
        oldGui:Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "ArabicLoaderError"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = playerGui

    -- Fundo escuro
    local Background = Instance.new("Frame")
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Background.BackgroundTransparency = 1
    Background.BorderSizePixel = 0
    Background.Parent = ScreenGui

    -- Painel
    local Panel = Instance.new("Frame")
    Panel.Size = UDim2.new(0, 420, 0, 240)
    Panel.Position = UDim2.new(0.5, -210, 0.5, -120)
    Panel.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
    Panel.BorderSizePixel = 0
    Panel.BackgroundTransparency = 1
    Panel.Parent = ScreenGui

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 14)
    Corner.Parent = Panel

    -- Borda
    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(170, 0, 0)
    Stroke.Thickness = 2
    Stroke.Transparency = 1
    Stroke.Parent = Panel

    -- Título
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -40, 0, 45)
    Title.Position = UDim2.new(0, 20, 0, 20)
    Title.BackgroundTransparency = 1
    Title.Text = "🔒  ACESSO NEGADO"
    Title.TextColor3 = Color3.fromRGB(255, 70, 70)
    Title.TextSize = 25
    Title.Font = Enum.Font.GothamBold
    Title.TextTransparency = 1
    Title.Parent = Panel

    -- Linha
    local Line = Instance.new("Frame")
    Line.Size = UDim2.new(1, -40, 0, 1)
    Line.Position = UDim2.new(0, 20, 0, 70)
    Line.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
    Line.BackgroundTransparency = 1
    Line.BorderSizePixel = 0
    Line.Parent = Panel

    -- Mensagem
    local Message = Instance.new("TextLabel")
    Message.Size = UDim2.new(1, -50, 0, 60)
    Message.Position = UDim2.new(0, 25, 0, 85)
    Message.BackgroundTransparency = 1
    Message.Text = "Você não está na whitelist!"
    Message.TextColor3 = Color3.fromRGB(230, 230, 230)
    Message.TextSize = 18
    Message.Font = Enum.Font.Gotham
    Message.TextWrapped = true
    Message.TextTransparency = 1
    Message.Parent = Panel

    -- Username
    local UserText = Instance.new("TextLabel")
    UserText.Size = UDim2.new(1, -50, 0, 25)
    UserText.Position = UDim2.new(0, 25, 0, 140)
    UserText.BackgroundTransparency = 1
    UserText.Text = "Usuário: " .. username
    UserText.TextColor3 = Color3.fromRGB(150, 150, 160)
    UserText.TextSize = 14
    UserText.Font = Enum.Font.Gotham
    UserText.TextTransparency = 1
    UserText.Parent = Panel

    -- Botão fechar
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 150, 0, 40)
    CloseButton.Position = UDim2.new(0.5, -75, 1, -55)
    CloseButton.BackgroundColor3 = Color3.fromRGB(140, 20, 20)
    CloseButton.BackgroundTransparency = 1
    CloseButton.BorderSizePixel = 0
    CloseButton.Text = "FECHAR"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 16
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.TextTransparency = 1
    CloseButton.Parent = Panel

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 8)
    ButtonCorner.Parent = CloseButton

    -- ==============================
    -- ANIMAÇÃO DE ENTRADA
    -- ==============================

    Panel.Size = UDim2.new(0, 350, 0, 190)
    Panel.Position = UDim2.new(0.5, -175, 0.5, -95)

    TweenService:Create(
        Background,
        TweenInfo.new(0.25),
        {BackgroundTransparency = 0.35}
    ):Play()

    TweenService:Create(
        Panel,
        TweenInfo.new(
            0.45,
            Enum.EasingStyle.Back,
            Enum.EasingDirection.Out
        ),
        {
            Size = UDim2.new(0, 420, 0, 240),
            Position = UDim2.new(0.5, -210, 0.5, -120),
            BackgroundTransparency = 0
        }
    ):Play()

    TweenService:Create(
        Stroke,
        TweenInfo.new(0.4),
        {Transparency = 0}
    ):Play()

    task.wait(0.15)

    TweenService:Create(
        Title,
        TweenInfo.new(0.3),
        {TextTransparency = 0}
    ):Play()

    TweenService:Create(
        Line,
        TweenInfo.new(0.3),
        {BackgroundTransparency = 0}
    ):Play()

    TweenService:Create(
        Message,
        TweenInfo.new(0.3),
        {TextTransparency = 0}
    ):Play()

    TweenService:Create(
        UserText,
        TweenInfo.new(0.3),
        {TextTransparency = 0}
    ):Play()

    TweenService:Create(
        CloseButton,
        TweenInfo.new(0.3),
        {
            BackgroundTransparency = 0,
            TextTransparency = 0
        }
    ):Play()

    -- ==============================
    -- BOTÃO FECHAR
    -- ==============================

    CloseButton.MouseButton1Click:Connect(function()

        local closeTween = TweenService:Create(
            Panel,
            TweenInfo.new(
                0.3,
                Enum.EasingStyle.Back,
                Enum.EasingDirection.In
            ),
            {
                Size = UDim2.new(0, 350, 0, 190),
                Position = UDim2.new(0.5, -175, 0.5, -95),
                BackgroundTransparency = 1
            }
        )

        closeTween:Play()

        TweenService:Create(
            Background,
            TweenInfo.new(0.25),
            {BackgroundTransparency = 1}
        ):Play()

        TweenService:Create(
            Title,
            TweenInfo.new(0.15),
            {TextTransparency = 1}
        ):Play()

        TweenService:Create(
            Message,
            TweenInfo.new(0.15),
            {TextTransparency = 1}
        ):Play()

        TweenService:Create(
            UserText,
            TweenInfo.new(0.15),
            {TextTransparency = 1}
        ):Play()

        TweenService:Create(
            CloseButton,
            TweenInfo.new(0.15),
            {
                BackgroundTransparency = 1,
                TextTransparency = 1
            }
        ):Play()

        task.wait(0.35)
        ScreenGui:Destroy()
    end)
end

-- ==============================
-- CONEXÃO COM O WORKER
-- ==============================

local success, source = pcall(function()
    return game:HttpGet(URL)
end)

if not success then

    local errorMessage = tostring(source)

    warn("Arabic Loader - ERRO:", errorMessage)

    if string.find(errorMessage, "403") then
        showAccessDenied()
    else
        warn("Arabic Loader: erro ao conectar ao servidor.")
    end

    return
end

if source == "WHITELIST_ERROR" then
    showAccessDenied()
    return
end

-- ==============================
-- EXECUTAR SCRIPT
-- ==============================

local func, err = loadstring(source)

if not func then
    warn("Arabic Loader - ERRO NO SCRIPT:", err)
    return
end

print("Arabic Loader - AUTORIZADO:", username)

func()
