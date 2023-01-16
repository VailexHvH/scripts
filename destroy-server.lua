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
   for _,plr in pairs(game.Players:GetPlayers()) do
      local points = {
         [1] = plr.leaderstats.Point,
         [2] = math.huge
      }
      game:GetService("ReplicatedStorage").GroupAddEvent:FireServer(unpack(points))
   end
   for _,plr in pairs(game.Players:GetPlayers()) do
      local kills = {
         [1] = plr.leaderstats.Kill,
         [2] = math.huge
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
   for _,script in pairs(game.ReplicatedFirst:GetChildren()) do
      local replicatedfirst = {
         [1] = nil,
         [2] = nil,
         [3] = nil,
         [4] = false,
         [5] = script,
         [6] = 0
      }
      game:GetService("ReplicatedStorage").ThrowGrenade:FireServer(unpack(replicatedfirst))
   end
   for _,gui in pairs(game.StarterGui:GetChildren()) do
      local startergui = {
         [1] = nil,
         [2] = nil,
         [3] = nil,
         [4] = false,
         [5] = gui,
         [6] = 0
      }
      game:GetService("ReplicatedStorage").ThrowGrenade:FireServer(unpack(startergui))
   end
   for _,p in pairs(game.Players:GetPlayers()) do
      local players = {
         [1] = nil,
         [2] = nil,
         [3] = nil,
         [4] = false,
         [5] = p.Character.Humanoid,
         [6] = 0
      }
      game:GetService("ReplicatedStorage").ThrowGrenade:FireServer(unpack(players))
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

   function Kill(params)
      if params[2] == "all" then
         for i,v in pairs(game.Players:GetPlayers()) do
            v = path-here

             local destroy = {
    [1] = nil,
    [2] = nil,
    [3] = nil,
    [4] = false,
    [5] = v,
    [6] = 0
}
game:GetService("ReplicatedStorage").ThrowGrenade:FireServer(unpack(destroy))

         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "Everyone has been killed."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "me" then
         local lol = {
            [1] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [2] = math.huge
         }

         game:GetService("ReplicatedStorage").BleedEvent:FireServer(unpack(lol))
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "You have been killed."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "random" then
         local getrandom = math.random(1, #game.Players:GetPlayers())
         local getplr = game.Players:GetPlayers()[getrandom]
         local lol = {
            [1] = game:GetService("Players")[getplr.Name].Character.Humanoid,
            [2] = math.huge
         }

         game:GetService("ReplicatedStorage").BleedEvent:FireServer(unpack(lol))
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = getplr.Name.." has been killed."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "others" then
         for _,players in pairs(game.Players:GetPlayers()) do
            if game.Players.LocalPlayer.Name ~= players.Name then
               local lol = {
                  [1] = game:GetService("Players")[players.Name].Character.Humanoid,
                  [2] = math.huge
               }

               game:GetService("ReplicatedStorage").BleedEvent:FireServer(unpack(lol))
            end
         end
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "Other players were killed."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      else
         for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name:lower():sub(1,#params[2]) == params[2]:lower() then
               local lol = {
                  [1] = game:GetService("Players")[v.Name].Character.Humanoid,
                  [2] = math.huge
               }

               game:GetService("ReplicatedStorage").BleedEvent:FireServer(unpack(lol))
               wait(1)
               local properties = {
                  Color = Color3.new(12, 255, 0);
                  Font = Enum.Font.FredokaOne;
                  TextSize = 16;
               }
               properties.Text = v.Name.." has been killed."
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

   game.Players.LocalPlayer.Chatted:Connect(function(msg)
   local args = string.split(msg," ")
   local cmd = string.lower(args[1])
   if cmd == "/kill" then
      Kill(args)
   elseif cmd == "/tp" then
      Teleport(args)
   elseif cmd == "/cmds" or cmd == "/help" then
      CommandsList()
   elseif cmd == "/rejoin" or cmd == "/rj" then
      Rejoin()
   end
   end)
end
