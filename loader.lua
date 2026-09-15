local a=game:GetService("Players")
local b=game:GetService("TweenService")
local c=a.LocalPlayer or a.PlayerAdded:Wait()
local d=c.Name
local e="https://arabic-loader.cadn-gta.workers.dev/?username="..d

local function f()
local g=c:WaitForChild("PlayerGui")
local h=g:FindFirstChild("ArabicLoaderError")
if h then h:Destroy() end

local i=Instance.new("ScreenGui")
i.Name="ArabicLoaderError"
i.ResetOnSpawn=false
i.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
i.Parent=g

local j=Instance.new("Frame")
j.Size=UDim2.new(1,0,1,0)
j.BackgroundColor3=Color3.fromRGB(0,0,0)
j.BackgroundTransparency=1
j.BorderSizePixel=0
j.Parent=i

local k=Instance.new("Frame")
k.Size=UDim2.new(0,420,0,240)
k.Position=UDim2.new(.5,-210,.5,-120)
k.BackgroundColor3=Color3.fromRGB(18,18,24)
k.BorderSizePixel=0
k.BackgroundTransparency=1
k.Parent=i

local l=Instance.new("UICorner")
l.CornerRadius=UDim.new(0,14)
l.Parent=k

local m=Instance.new("UIStroke")
m.Color=Color3.fromRGB(170,0,0)
m.Thickness=2
m.Transparency=1
m.Parent=k

local n=Instance.new("TextLabel")
n.Size=UDim2.new(1,-40,0,45)
n.Position=UDim2.new(0,20,0,20)
n.BackgroundTransparency=1
n.Text="🔒 ACCESS DENIED"
n.TextColor3=Color3.fromRGB(255,70,70)
n.TextSize=25
n.Font=Enum.Font.GothamBold
n.TextTransparency=1
n.Parent=k

local o=Instance.new("Frame")
o.Size=UDim2.new(1,-40,0,1)
o.Position=UDim2.new(0,20,0,70)
o.BackgroundColor3=Color3.fromRGB(170,0,0)
o.BackgroundTransparency=1
o.BorderSizePixel=0
o.Parent=k

local p=Instance.new("TextLabel")
p.Size=UDim2.new(1,-50,0,60)
p.Position=UDim2.new(0,25,0,85)
p.BackgroundTransparency=1
p.Text="Surprise, motherfucker. You're not on the list!"
p.TextColor3=Color3.fromRGB(230,230,230)
p.TextSize=18
p.Font=Enum.Font.Gotham
p.TextWrapped=true
p.TextTransparency=1
p.Parent=k

local q=Instance.new("TextLabel")
q.Size=UDim2.new(1,-50,0,25)
q.Position=UDim2.new(0,25,0,140)
q.BackgroundTransparency=1
q.Text="Usuário: "..d
q.TextColor3=Color3.fromRGB(150,150,160)
q.TextSize=14
q.Font=Enum.Font.Gotham
q.TextTransparency=1
q.Parent=k

local r=Instance.new("TextButton")
r.Size=UDim2.new(0,150,0,40)
r.Position=UDim2.new(.5,-75,1,-55)
r.BackgroundColor3=Color3.fromRGB(140,20,20)
r.BackgroundTransparency=1
r.BorderSizePixel=0
r.Text="FECHAR"
r.TextColor3=Color3.fromRGB(255,255,255)
r.TextSize=16
r.Font=Enum.Font.GothamBold
r.TextTransparency=1
r.Parent=k

local s=Instance.new("UICorner")
s.CornerRadius=UDim.new(0,8)
s.Parent=r

k.Size=UDim2.new(0,350,0,190)
k.Position=UDim2.new(.5,-175,.5,-95)

b:Create(j,TweenInfo.new(.25),{BackgroundTransparency=.35}):Play()

b:Create(k,TweenInfo.new(.45,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
Size=UDim2.new(0,420,0,240),
Position=UDim2.new(.5,-210,.5,-120),
BackgroundTransparency=0
}):Play()

b:Create(m,TweenInfo.new(.4),{Transparency=0}):Play()

task.wait(.15)

b:Create(n,TweenInfo.new(.3),{TextTransparency=0}):Play()
b:Create(o,TweenInfo.new(.3),{BackgroundTransparency=0}):Play()
b:Create(p,TweenInfo.new(.3),{TextTransparency=0}):Play()
b:Create(q,TweenInfo.new(.3),{TextTransparency=0}):Play()

b:Create(r,TweenInfo.new(.3),{
BackgroundTransparency=0,
TextTransparency=0
}):Play()

r.MouseButton1Click:Connect(function()

b:Create(k,TweenInfo.new(.3,Enum.EasingStyle.Back,Enum.EasingDirection.In),{
Size=UDim2.new(0,350,0,190),
Position=UDim2.new(.5,-175,.5,-95),
BackgroundTransparency=1
}):Play()

b:Create(j,TweenInfo.new(.25),{BackgroundTransparency=1}):Play()
b:Create(n,TweenInfo.new(.15),{TextTransparency=1}):Play()
b:Create(p,TweenInfo.new(.15),{TextTransparency=1}):Play()
b:Create(q,TweenInfo.new(.15),{TextTransparency=1}):Play()

b:Create(r,TweenInfo.new(.15),{
BackgroundTransparency=1,
TextTransparency=1
}):Play()

task.wait(.35)
i:Destroy()
end)
end

local t,u=pcall(function()
return game:HttpGet(e)
end)

if not t then
local v=tostring(u)
warn("Arabic Loader - ERRO:",v)

if string.find(v,"403") then
f()
else
warn("Arabic Loader: erro ao conectar ao servidor.")
end

return
end

if u=="WHITELIST_ERROR" then
f()
return
end

local w,x=loadstring(u)

if not w then
warn("Arabic Loader - ERRO NO SCRIPT:",x)
return
end

print("Arabic Loader - AUTORIZADO:",d)
w()
