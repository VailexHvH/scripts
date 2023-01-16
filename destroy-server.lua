local properties = {
   Color = Color3.new(12, 255, 0);
   Font = Enum.Font.FredokaOne;
   TextSize = 16;
}
wait(1)
properties.Text = "Destroying Server..."
game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
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
