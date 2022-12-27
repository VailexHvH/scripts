if game.PlaceId == 9329726891 then
   --gameplaceid start

   function Kill(params)
      if params[2] == "all" then
         for i,v in pairs(game.Players:GetPlayers()) do
            local ayo = {
               [1] = game:GetService("Players")[v.Name].Character.Humanoid,
               [2] = math.huge
            }

            game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
            wait(1)
            local properties = {
               Color = Color3.new(12, 255, 0);
               Font = Enum.Font.FredokaOne;
               TextSize = 16;
            }
            properties.Text = "Killing everyone..."
            game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
         end
      elseif params[2] == "me" then
         local ayo = {
            [1] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [2] = math.huge
         }

         game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
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
         local ayo = {
            [1] = game:GetService("Players")[getplr.Name].Character.Humanoid,
            [2] = math.huge
         }

         game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
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
               local ayo = {
                  [1] = game:GetService("Players")[players.Name].Character.Humanoid,
                  [2] = math.huge
               }

               game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
               wait(1)
               local properties = {
                  Color = Color3.new(12, 255, 0);
                  Font = Enum.Font.FredokaOne;
                  TextSize = 16;
               }
               properties.Text = "Killing other players..."
               game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
            end
         end
      else
         for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name:lower():sub(1,#params[2]) == params[2]:lower() then
               local ayo = {
                  [1] = game:GetService("Players")[v.Name].Character.Humanoid,
                  [2] = math.huge
               }

               game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
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

   function GiveMoney(params)
      local getnumber = params[2]
      local number = -getnumber
      local lmao = {
         [1] = game:GetService("Players").LocalPlayer,
         [2] = number
      }

      game:GetService("Lighting").SendWarMoneyEvent:FireServer(unpack(lmao))
      wait(1)
      local properties = {
         Color = Color3.new(12, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = "You've got "..params[2].." Cash."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
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

   function Godmode(params)
      if params[2] == "all" then
         for _,v in pairs(game.Players:GetPlayers()) do
            local ayo = {
               [1] = 0,
               [2] = "Level4vest",
               [3] = game:GetService("Players")[v.Name].Character.Humanoid,
               [4] = math.huge
            }

            game:GetService("Lighting").BuyVestEvent:FireServer(unpack(ayo))
            wait(1)
            local properties = {
               Color = Color3.new(12, 255, 0);
               Font = Enum.Font.FredokaOne;
               TextSize = 16;
            }
            properties.Text = "Everyone is now invincible."
            game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
         end
      elseif params[2] == "me" then
         local ayo = {
            [1] = 0,
            [2] = "Level4vest",
            [3] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [4] = math.huge
         }

         game:GetService("Lighting").BuyVestEvent:FireServer(unpack(ayo))
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "You're now invincible."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "others" then
         local plr = game.Players.LocalPlayer
         for _,others in pairs(game.Players:GetPlayers()) do
            if plr.Name ~= others.Name then
               local ayo = {
                  [1] = 0,
                  [2] = "Level4vest",
                  [3] = game:GetService("Players")[others.Name].Character.Humanoid,
                  [4] = math.huge
               }

               game:GetService("Lighting").BuyVestEvent:FireServer(unpack(ayo))
               wait(1)
               local properties = {
                  Color = Color3.new(12, 255, 0);
                  Font = Enum.Font.FredokaOne;
                  TextSize = 16;
               }
               properties.Text = "Other players are now invincible."
               game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
            end
         end
      elseif params[2] == "random" then
         local getrandom = math.random(1, #game.Players:GetPlayers())
         local getplr = game.Players:GetPlayers()[getrandom]
         local ayo = {
            [1] = 0,
            [2] = "Level4vest",
            [3] = game:GetService("Players")[getplr.Name].Character.Humanoid,
            [4] = math.huge
         }

         game:GetService("Lighting").BuyVestEvent:FireServer(unpack(ayo))
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = getplr.Name.." is now invincible."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      else
         for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name:lower():sub(1,#params[2]) == params[2]:lower() then
               local ayo = {
                  [1] = 0,
                  [2] = "Level4vest",
                  [3] = game:GetService("Players")[v.Name].Character.Humanoid,
                  [4] = math.huge
               }

               game:GetService("Lighting").BuyVestEvent:FireServer(unpack(ayo))
               wait(1)
               local properties = {
                  Color = Color3.new(12, 255, 0);
                  Font = Enum.Font.FredokaOne;
                  TextSize = 16;
               }
               properties.Text = v.Name.." is now invincible."
               game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
            end
         end
      end
   end

   function Heal(params)
      if params[2] == "all" then
         for _,v in pairs(game.Players:GetPlayers()) do
            local head = {
               [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.Head,
               [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
            }

            game:GetService("Lighting").UseBandageEvent:FireServer(unpack(head))
            local torso = {
               [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.Torso,
               [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
            }

            game:GetService("Lighting").UseBandageEvent:FireServer(unpack(torso))
            local rightarm = {
               [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.RightArm,
               [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
            }

            game:GetService("Lighting").UseBandageEvent:FireServer(unpack(rightarm))
            local leftarm = {
               [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.LeftArm,
               [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
            }

            game:GetService("Lighting").UseBandageEvent:FireServer(unpack(leftarm))
            local rightleg = {
               [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.RightLeg,
               [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
            }

            game:GetService("Lighting").UseBandageEvent:FireServer(unpack(rightleg))
            local leftleg = {
               [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.LeftLeg,
               [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
            }

            game:GetService("Lighting").UseBandageEvent:FireServer(unpack(leftleg))
            wait(1)
            local properties = {
               Color = Color3.new(12, 255, 0);
               Font = Enum.Font.FredokaOne;
               TextSize = 16;
            }
            properties.Text = "Everyone is healed now."
            game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
         end
      elseif params[2] == "me" then
         local head = {
            [1] = game:GetService("Players").LocalPlayer.Character.CharacterHealth.Head,
            [2] = game:GetService("Players").LocalPlayer.Character.CharacterHealth
         }

         game:GetService("Lighting").UseBandageEvent:FireServer(unpack(head))
         local torso = {
            [1] = game:GetService("Players").LocalPlayer.Character.CharacterHealth.Torso,
            [2] = game:GetService("Players").LocalPlayer.Character.CharacterHealth
         }

         game:GetService("Lighting").UseBandageEvent:FireServer(unpack(torso))
         local rightarm = {
            [1] = game:GetService("Players").LocalPlayer.Character.CharacterHealth.RightArm,
            [2] = game:GetService("Players").LocalPlayer.Character.CharacterHealth
         }

         game:GetService("Lighting").UseBandageEvent:FireServer(unpack(rightarm))
         local leftarm = {
            [1] = game:GetService("Players").LocalPlayer.Character.CharacterHealth.LeftArm,
            [2] = game:GetService("Players").LocalPlayer.Character.CharacterHealth
         }

         game:GetService("Lighting").UseBandageEvent:FireServer(unpack(leftarm))
         local rightleg = {
            [1] = game:GetService("Players").LocalPlayer.Character.CharacterHealth.RightLeg,
            [2] = game:GetService("Players").LocalPlayer.Character.CharacterHealth
         }

         game:GetService("Lighting").UseBandageEvent:FireServer(unpack(rightleg))
         local leftleg = {
            [1] = game:GetService("Players").LocalPlayer.Character.CharacterHealth.LeftLeg,
            [2] = game:GetService("Players").LocalPlayer.Character.CharacterHealth
         }

         game:GetService("Lighting").UseBandageEvent:FireServer(unpack(leftleg))
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "You're healed now."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "others" then
         for _,v in pairs(game.Players:GetPlayers()) do
            if game.Players.LocalPlayer.Name ~= v.Name then
               local head = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.Head,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("Lighting").UseBandageEvent:FireServer(unpack(head))
               local torso = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.Torso,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("Lighting").UseBandageEvent:FireServer(unpack(torso))
               local rightarm = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.RightArm,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("Lighting").UseBandageEvent:FireServer(unpack(rightarm))
               local leftarm = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.LeftArm,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("Lighting").UseBandageEvent:FireServer(unpack(leftarm))
               local rightleg = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.RightLeg,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("Lighting").UseBandageEvent:FireServer(unpack(rightleg))
               local leftleg = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.LeftLeg,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("Lighting").UseBandageEvent:FireServer(unpack(leftleg))
               wait(1)
               local properties = {
                  Color = Color3.new(12, 255, 0);
                  Font = Enum.Font.FredokaOne;
                  TextSize = 16;
               }
               properties.Text = "Other players are healed now."
               game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
            end
         end
      elseif params[2] == "random" then
         local getrandom = math.random(1, #game.Players:GetPlayers())
         local v = game.Players:GetPlayers()[getrandom]
         local head = {
            [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.Head,
            [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
         }

         game:GetService("Lighting").UseBandageEvent:FireServer(unpack(head))
         local torso = {
            [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.Torso,
            [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
         }

         game:GetService("Lighting").UseBandageEvent:FireServer(unpack(torso))
         local rightarm = {
            [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.RightArm,
            [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
         }

         game:GetService("Lighting").UseBandageEvent:FireServer(unpack(rightarm))
         local leftarm = {
            [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.LeftArm,
            [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
         }

         game:GetService("Lighting").UseBandageEvent:FireServer(unpack(leftarm))
         local rightleg = {
            [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.RightLeg,
            [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
         }

         game:GetService("Lighting").UseBandageEvent:FireServer(unpack(rightleg))
         local leftleg = {
            [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.LeftLeg,
            [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
         }

         game:GetService("Lighting").UseBandageEvent:FireServer(unpack(leftleg))
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = v.Name.." is healed now."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      else
         for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name:lower():sub(1,#params[2]) == params[2]:lower() then
               local head = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.Head,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("Lighting").UseBandageEvent:FireServer(unpack(head))
               local torso = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.Torso,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("Lighting").UseBandageEvent:FireServer(unpack(torso))
               local rightarm = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.RightArm,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("Lighting").UseBandageEvent:FireServer(unpack(rightarm))
               local leftarm = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.LeftArm,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("Lighting").UseBandageEvent:FireServer(unpack(leftarm))
               local rightleg = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.RightLeg,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("Lighting").UseBandageEvent:FireServer(unpack(rightleg))
               local leftleg = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.LeftLeg,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("Lighting").UseBandageEvent:FireServer(unpack(leftleg))
               wait(1)
               local properties = {
                  Color = Color3.new(12, 255, 0);
                  Font = Enum.Font.FredokaOne;
                  TextSize = 16;
               }
               properties.Text = v.Name.." is healed now."
               game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
            end
         end
      end
   end

   function GiveHP(params)
      if params[2] == "all" then
         for _,v in pairs(game.Players:GetPlayers()) do
            local health = {
               [1] = 0,
               [2] = "Level4vest",
               [3] = game:GetService("Players")[v.Name].Character.Humanoid,
               [4] = params[3]
            }

            game:GetService("Lighting").BuyVestEvent:FireServer(unpack(health))
            wait(1)
            local properties = {
               Color = Color3.new(12, 255, 0);
               Font = Enum.Font.FredokaOne;
               TextSize = 16;
            }
            properties.Text = "Everyone has gotten "..params[3].." HP."
            game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
         end
      elseif params[2] == "me" then
         local health = {
            [1] = 0,
            [2] = "Level4vest",
            [3] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [4] = params[3]
         }

         game:GetService("Lighting").BuyVestEvent:FireServer(unpack(health))
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "You have gotten "..params[3].." HP."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "random" then
         local getrandom = math.random(1, #game.Players:GetPlayers())
         local getplr = game.Players:GetPlayers()[getrandom]
         local health = {
            [1] = 0,
            [2] = "Level4vest",
            [3] = game:GetService("Players")[getplr.Name].Character.Humanoid,
            [4] = params[3]
         }

         game:GetService("Lighting").BuyVestEvent:FireServer(unpack(health))
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = getplr.Name.." has gotten "..params[3].." HP."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "others" then
         for _,v in pairs(game.Players:GetPlayers()) do
            if game.Players.LocalPlayer.Name ~= v.Name then
               local health = {
                  [1] = 0,
                  [2] = "Level4vest",
                  [3] = game:GetService("Players")[v.Name].Character.Humanoid,
                  [4] = params[3]
               }

               game:GetService("Lighting").BuyVestEvent:FireServer(unpack(health))
               wait(1)
               local properties = {
                  Color = Color3.new(12, 255, 0);
                  Font = Enum.Font.FredokaOne;
                  TextSize = 16;
               }
               properties.Text = "Other players have gotten "..params[3].." HP."
               game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
            end
         end
      else
         for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name:lower():sub(1,#params[2]) == params[2]:lower() then
               local health = {
                  [1] = 0,
                  [2] = "Level4vest",
                  [3] = game:GetService("Players")[v.Name].Character.Humanoid,
                  [4] = params[3]
               }

               game:GetService("Lighting").BuyVestEvent:FireServer(unpack(health))
               wait(1)
               local properties = {
                  Color = Color3.new(12, 255, 0);
                  Font = Enum.Font.FredokaOne;
                  TextSize = 16;
               }
               properties.Text = v.Name.." has gotten "..params[3].." HP."
               game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
            end
         end
      end
   end

   function CommandsList()
      local properties = {
         Color = Color3.new(12, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = "Commands:"
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = "/kill [Player] - Kill any player except players with godmode."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = "/givemoney [Amount] (Aliases: addmoney, give) - Gives you money."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = "/tp [Player] - Teleports you to any player."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = "/god [Player] - Gives godmode to any player."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = "/heal [Player] - Heals any player."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = "/givehp [Player] [Amount] - Gives health to any player."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = "/rejoin (Aliases: rj) - Rejoin."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   end

   function Rejoin()
      game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
   end

   game.Players.LocalPlayer.Chatted:Connect(function(msg)
   local args = string.split(msg," ")
   local cmd = string.lower(args[1])
   if cmd == "/kill" then
      Kill(args)
   elseif cmd == "/givemoney" or cmd == "/addmoney" or cmd == "/give" then
      GiveMoney(args)
   elseif cmd == "/tp" then
      Teleport(args)
   elseif cmd == "/god" then
      Godmode(args)
   elseif cmd == "/heal" then
      Heal(args)
   elseif cmd == "/givehp" then
      GiveHP(args)
   elseif cmd == "/cmds" or cmd == "/help" then
      CommandsList()
   elseif cmd == "/rejoin" or cmd == "/rj" then
      Rejoin()
   end
   end)

   local properties = {
      Color = Color3.new(12, 255, 0);
      Font = Enum.Font.FredokaOne;
      TextSize = 16;
   }

   game:GetService("StarterGui"):SetCore("SendNotification",
   {
      Title = "Admin Commands",
      Text = "Loaded! Use /cmds to see every command. Made by Gerashino#8015",
      Duration = 3
   }
   )

   properties.Text = "Script is now running! Use /cmds to see every command. Made by Gerashino#8015"
   game.StarterGui:SetCore("ChatMakeSystemMessage", properties)

   --gameplaceid end
end
