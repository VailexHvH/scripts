if not game:IsLoaded() then
    game.Loaded:Wait()
end

local wadahell_omg_nahweeeeeeyy = {
    13149910801
}

if table.find(wadahell_omg_nahweeeeeeyy, game.PlaceId) then

   if _G.TankSimulator2Lol_game then
       return
   end
   _G.TankSimulator2Lol_game = true

   local function findPlayer(plr)
      for i,v in pairs(game.Players:GetPlayers()) do
         if v.Name:lower():sub(1,#plr) == plr:lower() or v.DisplayName:lower():sub(1,#plr) == plr:lower() then
            return v;
         end
      end
      return nil
   end

   local function findRandom()
      local getrandom = math.random(1, #game.Players:GetPlayers())
      local player = game.Players:GetPlayers()[getrandom]
      return player
   end

   function msg(text)
      local properties = {
         Color = Color3.fromRGB(0, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = text
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   end

   function CommandsList()
      wait(1)
      msg("Commands:")
      msg(":kill [Player] - Kill any player except players with godmode.")
      msg(":tp [Player] - Teleports you to any player.")
      msg(":god [Player] - Gives godmode to any player.")
      msg(":heal [Player] - Heals any player.")
      msg(":setmoney [Player] [Amount] (Aliases: moneyset, setcash, cashset, setpoint, pointset, setpoints, pointsset) - Set's any amount of points to any player(s).")
      msg(":setkills [Player] [Amount] (Aliases: setkill, skills, skill) - Set's any amount of kills to any player(s).")
      msg(":givehp [Player] [Amount] (Aliases: hp) - Gives health to any player.")
      msg(":rejoin (Aliases: rj) - Rejoin.")
      msg(":clearsky (Aliases: removesky, deletesky) - Makes the sky clear. (Serverside)")
      msg(":ban [Player] (Aliases: serverban, sban, sb, b) - Ban any player.")
      msg(":kick [Player] (Aliases: k) - Kick player(s).")
      msg(":shutdown (Aliases: sd) - Shutdowns the server.")
      msg(":cleartanks (Aliases: ctanks, ct, deletetanks, dtanks, dt) - Clear all tanks on the server.")
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
            Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
                  Color = Color3.fromRGB(0, 255, 0);
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
            local number = tonumber(getnumber)
            lolman = v.leaderstats.Point

            local set = {
               [1] = lolman,
               [2] = number
            }

            game:GetService("ReplicatedStorage").ChangeSpeedEvent:FireServer(unpack(set))
         end
         wait(1)
         local properties = {
            Color = Color3.fromRGB(0, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "Everyone's points have been set to "..params[3].."."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "me" then
         local getnumber = params[3]
         local number = tonumber(getnumber)
         lolman = game.Players.LocalPlayer.leaderstats.Point

         local set = {
            [1] = lolman,
            [2] = number
         }

         game:GetService("ReplicatedStorage").ChangeSpeedEvent:FireServer(unpack(set))
         wait(1)
         local properties = {
            Color = Color3.fromRGB(0, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "Your points have been set to "..params[3].."."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "random" then
         local getrandom = math.random(1, #game.Players:GetPlayers())
         local getplr = game.Players:GetPlayers()[getrandom]
         local getnumber = params[3]
         local number = tonumber(getnumber)
         lolman = getplr.leaderstats.Point

         local set = {
            [1] = lolman,
            [2] = number
         }

         game:GetService("ReplicatedStorage").ChangeSpeedEvent:FireServer(unpack(set))
         wait(1)
         local properties = {
            Color = Color3.fromRGB(0, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = getplr.Name.."'s points have been set to "..params[3].."."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "others" then
         for i,v in pairs(game.Players:GetPlayers()) do
            if game.Players.LocalPlayer.Name ~= v.Name then
               local getnumber = params[3]
               local number = tonumber(getnumber)
               lolman = v.leaderstats.Point

               local set = {
                  [1] = lolman,
                  [2] = number
               }

               game:GetService("ReplicatedStorage").ChangeSpeedEvent:FireServer(unpack(set))
            end
         end
         wait(1)
         local properties = {
            Color = Color3.fromRGB(0, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "Other Players points have been set to "..params[3].."."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      else
         local player = findPlayer(params[2])
         local getnumber = params[3]
         local number = tonumber(getnumber)
         lolman = player.leaderstats.Point

         local set = {
            [1] = lolman,
            [2] = number
         }

         game:GetService("ReplicatedStorage").ChangeSpeedEvent:FireServer(unpack(set))
         wait(1)
         local properties = {
            Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
                  Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
                  Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
            Color = Color3.fromRGB(0, 255, 0);
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
                  Color = Color3.fromRGB(0, 255, 0);
                  Font = Enum.Font.FredokaOne;
                  TextSize = 16;
               }
               properties.Text = v.Name.." has gotten "..params[3].." HP."
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

   function ClearSky()
      for _, v in pairs(game.Lighting.Skies:GetChildren()) do
         local skies = {
             [1] = v
         }
         game:GetService("ReplicatedStorage").HitSkurtEvent:FireServer(unpack(skies))
      end
      for _, v in pairs(game.Lighting:GetChildren()) do
         if v:IsA("Sky") then
            local sky = {
                [1] = v
            }
            game:GetService("ReplicatedStorage").HitSkurtEvent:FireServer(unpack(sky))
         end
      end
      wait(1)
      msg("Sky is clear now.")
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
         local plr = findPlayer(pr[2])
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

   function Ban(pr)
      if pr[2] == "all" then
         local everyone = {}
         for _, v in pairs(game.Players:GetPlayers()) do
            if game.Players.LocalPlayer.Name ~= v.Name then
               table.insert(everyone, v.Name)
            end
         end
         game.Players.PlayerAdded:Connect(function(plr)
         if table.find(everyone, plr.Name) then
            local yeah = {
               [1] = plr
            }
            game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(yeah))
         end
         end)
         wait(1)
         msg("Everyone has been banned.")
         for _, v in pairs(game.Players:GetPlayers()) do
            if game.Players.LocalPlayer.Name ~= v.Name then
               local yeah = {
               [1] = v
            }
            game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(yeah))
            end
         end
      elseif pr[2] == "others" then
         local everyone = {}
         for _, v in pairs(game.Players:GetPlayers()) do
            if game.Players.LocalPlayer.Name ~= v.Name then
               table.insert(everyone, v.Name)
            end
         end
         game.Players.PlayerAdded:Connect(function(plr)
         if table.find(everyone, plr.Name) then
            local yeah = {
               [1] = plr
            }
            game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(yeah))
         end
         end)
         wait(1)
         msg("Other players were banned.")
         for _, v in pairs(game.Players:GetPlayers()) do
            if game.Players.LocalPlayer.Name ~= v.Name then
               local yeah = {
               [1] = v
            }
            game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(yeah))
            end
         end
      elseif pr[2] == "random" then
         local bro = findRandom()
         game.Players.PlayerAdded:Connect(function(plr)
         if plr.Name == bro.Name then
            local yeah = {
               [1] = plr
            }

            game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(yeah))
         end
         end)
         wait(1)
         msg(bro.Name.." has been banned.")
         local yeah = {
            [1] = bro
         }

         game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(yeah))
      else
         local guy = findPlayer(pr[2])
         game.Players.PlayerAdded:Connect(function(plr)
         if plr.Name == guy.Name then
            local yeah = {
               [1] = plr
            }

            game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(yeah))
         end
         end)
         wait(1)
         msg(guy.Name.." has been banned.")
         local yeah = {
            [1] = guy
         }

         game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(yeah))
      end
   end

   function Shutdown()
      wait(1)
      msg("Shutting down server...")
      --[[for _,w in pairs(workspace:GetChildren()) do
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
      end]]
      game.Players.PlayerAdded:Connect(function(plr)
         local bye = {
             [1] = plr
         }

         game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(bye))
      end)
      wait(1)
      for _,p in pairs(game.Players:GetPlayers()) do
         if game.Players.LocalPlayer.Name ~= p.Name then
            local yeah = {
               [1] = p
            }

            game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(yeah))
         end
      end
      wait(2)
      game.Players.LocalPlayer:Kick("Shutdown.")
   end

   function ClearTanks()
      for i,v in pairs(workspace.TankFolder:GetChildren()) do
         local deletelol = {
             [1] = v
         }

         game.ReplicatedStorage.HitSkurtEvent:FireServer(unpack(deletelol))
      end
      wait(1)
      msg("All Tanks were cleared.")
   end

   function SetKills(params)
      if params[2] == "all" then
         for i,v in pairs(game.Players:GetPlayers()) do
            local getnumber = params[3]
            local number = tonumber(getnumber)
            lolman = v.leaderstats.Kill

            local set = {
               [1] = lolman,
               [2] = number
            }

            game:GetService("ReplicatedStorage").ChangeSpeedEvent:FireServer(unpack(set))
         end
         wait(1)
         local properties = {
            Color = Color3.fromRGB(0, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "Everyone's kills have been set to "..params[3].."."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "me" then
         local getnumber = params[3]
         local number = tonumber(getnumber)
         lolman = game.Players.LocalPlayer.leaderstats.Kill

         local set = {
            [1] = lolman,
            [2] = number
         }

         game:GetService("ReplicatedStorage").ChangeSpeedEvent:FireServer(unpack(set))
         wait(1)
         local properties = {
            Color = Color3.fromRGB(0, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "Your kills have been set to "..params[3].."."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "random" then
         local getrandom = math.random(1, #game.Players:GetPlayers())
         local getplr = game.Players:GetPlayers()[getrandom]
         local getnumber = params[3]
         local number = tonumber(getnumber)
         lolman = getplr.leaderstats.Kill

         local set = {
            [1] = lolman,
            [2] = number
         }

         game:GetService("ReplicatedStorage").ChangeSpeedEvent:FireServer(unpack(set))
         wait(1)
         local properties = {
            Color = Color3.fromRGB(0, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = getplr.Name.."'s kills have been set to "..params[3].."."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      elseif params[2] == "others" then
         for i,v in pairs(game.Players:GetPlayers()) do
            if game.Players.LocalPlayer.Name ~= v.Name then
               local getnumber = params[3]
               local number = tonumber(getnumber)
               lolman = v.leaderstats.Kill

               local set = {
                  [1] = lolman,
                  [2] = number
               }

               game:GetService("ReplicatedStorage").ChangeSpeedEvent:FireServer(unpack(set))
            end
         end
         wait(1)
         local properties = {
            Color = Color3.fromRGB(0, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = "Other Players kills have been set to "..params[3].."."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      else
         local player = findPlayer(params[2])
         local getnumber = params[3]
         local number = tonumber(getnumber)
         lolman = player.leaderstats.Kill

         local set = {
            [1] = lolman,
            [2] = number
         }

         game:GetService("ReplicatedStorage").ChangeSpeedEvent:FireServer(unpack(set))
         wait(1)
         local properties = {
            Color = Color3.fromRGB(0, 255, 0);
            Font = Enum.Font.FredokaOne;
            TextSize = 16;
         }
         properties.Text = player.Name.."'s kills have been set to "..params[3].."."
         game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
      end
   end

   game.Players.LocalPlayer.Chatted:Connect(function(msg)
   local args = string.split(msg, " ")
   local cmd = string.lower(args[1])
   if cmd == ":kill" then
      Kill(args)
   elseif cmd == ":tp" then
      Teleport(args)
   elseif cmd == ":god" then
      Godmode(args)
   elseif cmd == ":heal" then
      Heal(args)
   elseif cmd == ":setmoney" or cmd == ":moneyset" or cmd == ":setcash" or cmd == ":cashset" or cmd == ":setpoint" or cmd == ":pointset" or cmd == ":setpoints" or cmd == ":pointsset" then
      SetMoney(args)
   elseif cmd == ":givehp" or cmd == ":hp" then
      GiveHP(args)
   elseif cmd == ":cmds" or cmd == ":help" then
      CommandsList()
   elseif cmd == ":rejoin" or cmd == ":rj" then
      Rejoin()
   elseif cmd == ":clearsky" or cmd == ":removesky" or cmd == ":deletesky" then
      ClearSky()
   elseif cmd == ":ban" or cmd == ":serverban" or cmd == ":sban" or cmd == ":sb" or cmd == ":b" then
      Ban(args)
   elseif cmd == ":kick" or cmd == ":k" then
      Kick(args)
   elseif cmd == ":shutdown" or cmd == ":sd" then
      Shutdown()
   elseif cmd == ":cleartanks" or cmd == ":ctanks" or cmd == ":ct" or cmd == ":deletetanks" or cmd == ":dtanks" or cmd == ":dt" then
      ClearTanks()
   elseif cmd == ":setkills" or cmd == ":setkill" or cmd == ":skills" or cmd == ":skill" then
      SetKills(args)
   end
   end)

   game.Lighting.BlurEffect.Enabled = false

   --[[pcall(function()
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
   end)]]

   game:GetService("StarterGui"):SetCore("SendNotification",
   {
      Title = "Admin Commands",
      Text = "Loaded! Use :cmds to see every command. Made by Gerashino#8015",
      Duration = 3
   }
   )

   msg("Script is now running! Use :cmds to see every command. Made by Gerashino#8015")

   --gameplaceid end
end
