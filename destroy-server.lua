if game.PlaceId == 11698235691 or game.PlaceId == 11940161478 or game.PlaceId == 12015736082 or game.PlaceId == 12173240994 then
   game:GetService("StarterGui"):SetCore("SendNotification",
   {
      Title = "Server Destroyer",
      Text = "Loaded! Made by Gerashino#8015",
      Duration = 3
   }
   )
   local properties = {
      Color = Color3.new(12, 255, 0);
      Font = Enum.Font.FredokaOne;
      TextSize = 16;
   }
   properties.Text = "Server Destroyer. Made by Gerashino#8015"
   game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   properties.Text = "Use /cmds to see all the commands."
   game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   properties.Text = "Destroying Server..."
   game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   wait(1)
   for _,t in pairs(game.Teams:GetChildren()) do
main = game.Teams
file = t.Name

allfnm = main[file]
local args = {
    [1] = main,
    [2] = allfnm,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [6] = 0,
    [7] = 0,
    [8] = "",
    [9] = allfnm,
    [10] = main
}

game:GetService("ReplicatedStorage").AntiTankMissileFireEvent:FireServer(unpack(args))
   end

main = game.ReplicatedStorage
file = "VoteKickGui"

allfnm = main[file]
local args = {
    [1] = main,
    [2] = allfnm,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [6] = 0,
    [7] = 0,
    [8] = "",
    [9] = allfnm,
    [10] = main
}

game:GetService("ReplicatedStorage").AntiTankMissileFireEvent:FireServer(unpack(args))

   for _,script in pairs(game.ReplicatedFirst:GetChildren()) do
main = game.ReplicatedFirst
file = script.Name

allfnm = main[file]
local args = {
    [1] = main,
    [2] = allfnm,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [6] = 0,
    [7] = 0,
    [8] = "",
    [9] = allfnm,
    [10] = main
}

game:GetService("ReplicatedStorage").AntiTankMissileFireEvent:FireServer(unpack(args))
   end
   for _,gui in pairs(game.StarterGui:GetChildren()) do
main = game.StarterGui
file = gui.Name

allfnm = main[file]
local args = {
    [1] = main,
    [2] = allfnm,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [6] = 0,
    [7] = 0,
    [8] = "",
    [9] = allfnm,
    [10] = main
}

game:GetService("ReplicatedStorage").AntiTankMissileFireEvent:FireServer(unpack(args))
   end

for _,l in pairs(game.Lighting:GetChildren()) do

end

   properties.Text = "Server has been successfully destroyed!"
   game.StarterGui:SetCore("ChatMakeSystemMessage", properties)

   function Teleport(params)
      if params[2] == "random" then
         local getrandom = math.random(1, #game.Players:GetPlayers())
         local getplr = game.Players:GetPlayers()[getrandom]
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[getplr.Name].Character.HumanoidRootPart.CFrame
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "Teleporting to "..getplr.Name.."."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      else
         for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name:lower():sub(1,#params[2]) == params[2]:lower() then
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
               wait(1)
               local properties = {
                  Color = Color3.new(12, 255, 0);
                  Font = Enum.Font.FredokaOne;
                  TextSize = 16;
               }
               properties.Text = "Teleporting to "..v.Name.."."
               game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
            end
         end
      end
   end

   function Rejoin()
      game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
      wait(1)
      local properties = {
         Color = Color3.new(12, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = "Rejoining..."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   end

   function CommandsList()
      local properties = {
         Color = Color3.new(12, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      wait(1)
      properties.Text = "Commands:"
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = "/teleport [Player] (Aliases: tp, goto) - Teleports you to any player."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = "/rejoin (Aliases: rj) - Rejoin."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   end

   game.Players.LocalPlayer.Chatted:Connect(function(msg)
   local args = string.split(msg," ")
   local cmd = string.lower(args[1])
   if cmd == "/tp" or cmd == "/teleport" or cmd == "/goto" then
      Teleport(args)
   elseif cmd == "/cmds" or cmd == "/help" then
      CommandsList()
   elseif cmd == "/rejoin" or cmd == "/rj" then
      Rejoin()
   end
   end)
end
