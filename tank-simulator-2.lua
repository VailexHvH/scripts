if game.PlaceId == 11698235691 or game.PlaceId == 11940161478 or game.PlaceId == 12015736082 then
   --gameplaceid start

   prefix = "/"

   local function findplr(plr)
      for i,v in pairs(game.Players:GetPlayers()) do
         if v.Name:lower():sub(1,#plr) == plr:lower() then
            return v;
         end
      end
      return nil
   end

   function Kill(params)
      if params[2] == "all" then
         for i,v in pairs(game.Players:GetPlayers()) do
            local lol = {
               [1] = game:GetService("Players")[v.Name].Character.Humanoid,
               [2] = math.huge
            }

            game:GetService("ReplicatedStorage").BleedEvent:FireServer(unpack(lol))
         end
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

   function SetMoney(params)
      if params[2] == "all" then
         for i,v in pairs(game.Players:GetPlayers()) do
            local getnumber = params[3]
            local number = getnumber
            lolman = v.leaderstats.Point

            local set = {
               [1] = lolman,
               [2] = number
            }

            game:GetService("ReplicatedStorage").GroupAddEvent:FireServer(unpack(set))
         end
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "Everyone's points have been set to "..params[3].."."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "me" then
         local getnumber = params[3]
         local number = getnumber
         lolman = game.Players.LocalPlayer.leaderstats.Point

         local set = {
            [1] = lolman,
            [2] = number
         }

         game:GetService("ReplicatedStorage").GroupAddEvent:FireServer(unpack(set))
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "Your points have been set to "..params[3].."."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "random" then
         local getrandom = math.random(1, #game.Players:GetPlayers())
         local getplr = game.Players:GetPlayers()[getrandom]
         local getnumber = params[3]
         local number = getnumber
         lolman = getplr.leaderstats.Point

         local set = {
            [1] = lolman,
            [2] = number
         }

         game:GetService("ReplicatedStorage").GroupAddEvent:FireServer(unpack(set))
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = getplr.Name.."'s points have been set to "..params[3].."."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "others" then
         for i,v in pairs(game.Players:GetPlayers()) do
            if game.Players.LocalPlayer.Name ~= v.Name then
               local getnumber = params[3]
               local number = getnumber
               lolman = v.leaderstats.Point

               local set = {
                  [1] = lolman,
                  [2] = number
               }

               game:GetService("ReplicatedStorage").GroupAddEvent:FireServer(unpack(set))
            end
         end
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "Other Players points have been set to "..params[3].."."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      else
         local player = findplr(params[2])
         local getnumber = params[3]
         local number = getnumber
         lolman = player.leaderstats.Point

         local set = {
            [1] = lolman,
            [2] = number
         }

         game:GetService("ReplicatedStorage").GroupAddEvent:FireServer(unpack(set))
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = player.Name.."'s points have been set to "..params[3].."."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      end
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
            local lol = {
               [1] = game:GetService("Players")[v.Name].Character.Humanoid,
               [2] = -math.huge
            }

            game:GetService("ReplicatedStorage").BleedEvent:FireServer(unpack(lol))
         end
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "Everyone is now invincible."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "me" then
         local lol = {
            [1] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [2] = -math.huge
         }

         game:GetService("ReplicatedStorage").BleedEvent:FireServer(unpack(lol))
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
               local lol = {
                  [1] = game:GetService("Players")[others.Name].Character.Humanoid,
                  [2] = -math.huge
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
         properties.Text = "Other players are now invincible."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "random" then
         local getrandom = math.random(1, #game.Players:GetPlayers())
         local getplr = game.Players:GetPlayers()[getrandom]
         local lol = {
            [1] = game:GetService("Players")[getplr.Name].Character.Humanoid,
            [2] = -math.huge
         }

         game:GetService("ReplicatedStorage").BleedEvent:FireServer(unpack(lol))
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
               local lol = {
                  [1] = game:GetService("Players")[v.Name].Character.Humanoid,
                  [2] = -math.huge
               }

               game:GetService("ReplicatedStorage").BleedEvent:FireServer(unpack(lol))
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

            game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(head))
            local torso = {
               [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.Torso,
               [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
            }

            game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(torso))
            local rightarm = {
               [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.RightArm,
               [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
            }

            game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(rightarm))
            local leftarm = {
               [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.LeftArm,
               [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
            }

            game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(leftarm))
            local rightleg = {
               [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.RightLeg,
               [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
            }

            game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(rightleg))
            local leftleg = {
               [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.LeftLeg,
               [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
            }

            game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(leftleg))
         end
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "Everyone is healed now."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "me" then
         local head = {
            [1] = game:GetService("Players").LocalPlayer.Character.CharacterHealth.Head,
            [2] = game:GetService("Players").LocalPlayer.Character.CharacterHealth
         }

         game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(head))
         local torso = {
            [1] = game:GetService("Players").LocalPlayer.Character.CharacterHealth.Torso,
            [2] = game:GetService("Players").LocalPlayer.Character.CharacterHealth
         }

         game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(torso))
         local rightarm = {
            [1] = game:GetService("Players").LocalPlayer.Character.CharacterHealth.RightArm,
            [2] = game:GetService("Players").LocalPlayer.Character.CharacterHealth
         }

         game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(rightarm))
         local leftarm = {
            [1] = game:GetService("Players").LocalPlayer.Character.CharacterHealth.LeftArm,
            [2] = game:GetService("Players").LocalPlayer.Character.CharacterHealth
         }

         game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(leftarm))
         local rightleg = {
            [1] = game:GetService("Players").LocalPlayer.Character.CharacterHealth.RightLeg,
            [2] = game:GetService("Players").LocalPlayer.Character.CharacterHealth
         }

         game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(rightleg))
         local leftleg = {
            [1] = game:GetService("Players").LocalPlayer.Character.CharacterHealth.LeftLeg,
            [2] = game:GetService("Players").LocalPlayer.Character.CharacterHealth
         }

         game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(leftleg))
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

               game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(head))
               local torso = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.Torso,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(torso))
               local rightarm = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.RightArm,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(rightarm))
               local leftarm = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.LeftArm,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(leftarm))
               local rightleg = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.RightLeg,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(rightleg))
               local leftleg = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.LeftLeg,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(leftleg))
            end
         end
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "Other players are healed now."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "random" then
         local getrandom = math.random(1, #game.Players:GetPlayers())
         local v = game.Players:GetPlayers()[getrandom]
         local head = {
            [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.Head,
            [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
         }

         game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(head))
         local torso = {
            [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.Torso,
            [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
         }

         game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(torso))
         local rightarm = {
            [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.RightArm,
            [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
         }

         game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(rightarm))
         local leftarm = {
            [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.LeftArm,
            [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
         }

         game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(leftarm))
         local rightleg = {
            [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.RightLeg,
            [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
         }

         game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(rightleg))
         local leftleg = {
            [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.LeftLeg,
            [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
         }

         game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(leftleg))
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

               game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(head))
               local torso = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.Torso,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(torso))
               local rightarm = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.RightArm,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(rightarm))
               local leftarm = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.LeftArm,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(leftarm))
               local rightleg = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.RightLeg,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(rightleg))
               local leftleg = {
                  [1] = game:GetService("Players")[v.Name].Character.CharacterHealth.LeftLeg,
                  [2] = game:GetService("Players")[v.Name].Character.CharacterHealth
               }

               game:GetService("ReplicatedStorage").UseBandageEvent:FireServer(unpack(leftleg))
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
            local getnumber = params[3]
            local number = -getnumber
            local lol = {
               [1] = game:GetService("Players")[v.Name].Character.Humanoid,
               [2] = number
            }

            game:GetService("ReplicatedStorage").BleedEvent:FireServer(unpack(lol))
         end
         wait(1)
         local properties = {
            Color = Color3.new(12, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "Everyone has gotten "..params[3].." HP."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "me" then
         local getnumber = params[3]
         local number = -getnumber
         local lol = {
            [1] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [2] = number
         }

         game:GetService("ReplicatedStorage").BleedEvent:FireServer(unpack(lol))
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
         local getnumber = params[3]
         local number = -getnumber
         local lol = {
            [1] = game:GetService("Players")[getplr.Name].Character.Humanoid,
            [2] = number
         }

         game:GetService("ReplicatedStorage").BleedEvent:FireServer(unpack(lol))
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
               local getnumber = params[3]
               local number = -getnumber
               local lol = {
                  [1] = game:GetService("Players")[v.Name].Character.Humanoid,
                  [2] = number
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
         properties.Text = "Other players have gotten "..params[3].." HP."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      else
         for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name:lower():sub(1,#params[2]) == params[2]:lower() then
               local getnumber = params[3]
               local number = -getnumber
               local lol = {
                  [1] = game:GetService("Players")[v.Name].Character.Humanoid,
                  [2] = number
               }

               game:GetService("ReplicatedStorage").BleedEvent:FireServer(unpack(lol))
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
      wait(1)
      properties.Text = "Commands:"
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = prefix.."kill [Player] - Kill any player except players with godmode."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = prefix.."tp [Player] - Teleports you to any player."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = prefix.."god [Player] - Gives godmode to any player."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = prefix.."heal [Player] - Heals any player."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = prefix.."setmoney [Player] [Amount] (Aliases: moneyset, setcash, cashset, setpoint, pointset, setpoints, pointsset) - Set's any amount of points to any player u want."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = prefix.."givehp [Player] [Amount] (Aliases: hp) - Gives health to any player."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = prefix.."rejoin (Aliases: rj) - Rejoin."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = prefix.."clearsky (Aliases: removesky, deletesky) - Makes the sky clear. (Serverside)"
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = prefix.."kick (Aliases: k) - Kick any player u want."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      properties.Text = "!setprefix [Prefix] - Change the prefix of the commands."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
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

   function ClearSky()
      v = game.Lighting.Skies

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
      properties.Text = "Sky is clear now."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   end

   function Kick(params)
      local plr = findplr(params[2])
      local args = {
         [1] = plr
      }

      game:GetService("ReplicatedStorage").VoteKickEvent:FireServer(unpack(args))
      wait(1)
      game:GetService("ReplicatedStorage").YesEvent:FireServer()
      wait(10)
      local properties = {
         Color = Color3.new(12, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = "Kicked "..plr.Name..". You can use this command after 60 seconds."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   end

   game.Players.LocalPlayer.Chatted:Connect(function(msg)
   local args = string.split(msg," ")
   local cmd = string.lower(args[1])
   if cmd == prefix.."kill" then
      Kill(args)
   elseif cmd == prefix.."tp" then
      Teleport(args)
   elseif cmd == prefix.."god" then
      Godmode(args)
   elseif cmd == prefix.."heal" then
      Heal(args)
   elseif cmd == prefix.."setmoney" or cmd == prefix.."moneyset" or cmd == prefix.."setcash" or cmd == prefix.."cashset" or cmd == prefix.."setpoint" or cmd == prefix.."pointset" or cmd == prefix.."setpoints" or cmd == prefix.."pointsset" then
      SetMoney(args
   elseif cmd == prefix.."givehp" or cmd == prefix.."hp" then
      GiveHP(args)
   elseif cmd == prefix.."cmds" or cmd == prefix.."help" then
      CommandsList()
   elseif cmd == prefix.."rejoin" or cmd == prefix.."rj" then
      Rejoin()
   elseif cmd == prefix.."clearsky" or cmd == prefix.."removesky" or cmd == prefix.."deletesky" then
      ClearSky()
   elseif cmd == prefix.."kick" or cmd == prefix.."k" then
      Kick(args)
   elseif cmd == "!setprefix" then
      prefix = args[2]
   end
   end)

   game.RunService.Heartbeat:Connect(function()
      pcall(function()
         game.Lighting.BlurEffect.Size = 0
      end)
   end)

   pcall(function()
      local yesbutton = {
          [1] = nil,
          [2] = nil,
          [3] = nil,
          [4] = false,
          [5] = game.ReplicatedStorage.VoteKickGui.Frame.YesButton,
          [6] = 0
      }
      game:GetService("ReplicatedStorage").ThrowGrenade:FireServer(unpack(yesbutton))
      local nobutton = {
          [1] = nil,
          [2] = nil,
          [3] = nil,
          [4] = false,
          [5] = game.ReplicatedStorage.VoteKickGui.Frame.NoButton,
          [6] = 0
      }
      game:GetService("ReplicatedStorage").ThrowGrenade:FireServer(unpack(nobutton))
      local madebyname = {
          [1] = nil,
          [2] = nil,
          [3] = nil,
          [4] = false,
          [5] = game.ReplicatedStorage.VoteKickGui.Frame.MadeByName,
          [6] = 0
      }
      game:GetService("ReplicatedStorage").ThrowGrenade:FireServer(unpack(madebyname))
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
