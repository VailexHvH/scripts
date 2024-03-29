if not game:IsLoaded() then
   game.Loaded:Wait()
end

if game.PlaceId ~= 9329726891 then
   return
end

if _G.TankSimulatorLol_game then
   return
end
_G.TankSimulatorLol_game = true

local function findPlayer(plr)
   for i,v in pairs(game.Players:GetPlayers()) do
      if v.Name:lower():sub(1,#plr) == plr:lower() or v.DisplayName:lower():sub(1,#plr) == plr:lower() then
         return v;
      end
   end
   return nil
end

local function findRandom()
   return game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]
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
   msg("Some commands might not work because they're patched.")
   msg("Commands:")
   msg("/kill [Player] (Aliases: k) - Kill any player(s) except players with godmode.")
   msg("/killteam [Team] (Aliases: killt, kt) - Kill every player in the specific team.")
   msg("/givemoney [Player] [Amount] (Aliases: addmoney, give) - Gives money to any player you want.")
   msg("/tp [Player] - Teleports you to any player.")
   msg("/god [Player] - Gives godmode to any player.")
   msg("/heal [Player] - Heals any player.")
   msg("/speed [Amount] - Change your speed.")
   msg("/givehp [Player] [Amount] (Aliases: hp) - Gives health to any player.")
   msg("/rejoin (Aliases: rj) - Rejoin.")
   msg("/clearsky (Aliases: removesky, deletesky) - Makes the sky clear. (Serverside) (patched)")
   msg("/godkill (Aliases: gkill) - Kill player(s) with godmode or without. (patched)")
   msg("/rank [Player] - Rank someone.")
   msg("/unrank [Player] - Unrank someone who's ranked.")
end

function Kill(params)
   if params[2] == "all" then
      for i,v in pairs(game.Players:GetPlayers()) do
         local ayo = {
            [1] = game:GetService("Players")[v.Name].Character.Humanoid,
            [2] = math.huge
         }

         game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
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
      local ayo = {
         [1] = game:GetService("Players").LocalPlayer.Character.Humanoid,
         [2] = math.huge
      }

      game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
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
      local ayo = {
         [1] = game:GetService("Players")[getplr.Name].Character.Humanoid,
         [2] = math.huge
      }

      game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
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
            local ayo = {
               [1] = game:GetService("Players")[players.Name].Character.Humanoid,
               [2] = math.huge
            }

            game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
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
      local v = findPlayer(params[2])
      local ayo = {
         [1] = game:GetService("Players")[v.Name].Character.Humanoid,
         [2] = math.huge
      }

      game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
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

function GiveMoney(params)
   if params[2] == "all" then
      for _, v in pairs(game.Players:GetPlayers()) do
         local lmao = {
            [1] = -math.floor(tonumber(params[3])/0.7),
            [2] = "",
            [3] = game:GetService("Players").LocalPlayer,
            [4] = 0
         }
         game:GetService("Lighting").BuyMaskEvent:FireServer(unpack(lmao))
         local givmoneypls = {
            [1] = v,
            [2] = math.floor(tonumber(params[3])/0.7)
         }
         game:GetService("Lighting").SendWarMoneyEvent:FireServer(unpack(givmoneypls))
      end
      wait(1)
      msg("Everyone has received "..params[3].." Cash.")
   elseif params[2] == "me" then
      local lmao = {
         [1] = -tonumber(params[3]),
         [2] = "",
         [3] = game:GetService("Players").LocalPlayer,
         [4] = 0
      }
      game:GetService("Lighting").BuyMaskEvent:FireServer(unpack(lmao))
      wait(1)
      msg("You have received "..params[3].." Cash.")
   elseif params[2] == "random" then
      local plr = findRandom()
      local lmao = {
         [1] = -math.floor(tonumber(params[3])/0.7),
         [2] = "",
         [3] = game:GetService("Players").LocalPlayer,
         [4] = 0
      }
      game:GetService("Lighting").BuyMaskEvent:FireServer(unpack(lmao))
      local givmoneypls = {
         [1] = plr,
         [2] = math.floor(tonumber(params[3])/0.7)
      }
      game:GetService("Lighting").SendWarMoneyEvent:FireServer(unpack(givmoneypls))
      wait(1)
      msg(plr.Name.." has received "..params[3].." Cash.")
   elseif params[2] == "others" then
      for _, v in pairs(game.Players:GetPlayers()) do
         if game.Players.LocalPlayer.Name ~= v.Name then
            local lmao = {
               [1] = -math.floor(tonumber(params[3])/0.7),
               [2] = "",
               [3] = game:GetService("Players").LocalPlayer,
               [4] = 0
            }
            game:GetService("Lighting").BuyMaskEvent:FireServer(unpack(lmao))
            local givmoneypls = {
               [1] = v,
               [2] = math.floor(tonumber(params[3])/0.7)
            }
            game:GetService("Lighting").SendWarMoneyEvent:FireServer(unpack(givmoneypls))
         end
      end
      wait(1)
      msg("Other players has received "..params[3].." Cash.")
   else
      local plr = findPlayer(params[2])
      local lmao = {
         [1] = -math.floor(tonumber(params[3])/0.7),
         [2] = "",
         [3] = game:GetService("Players").LocalPlayer,
         [4] = 0
      }
      game:GetService("Lighting").BuyMaskEvent:FireServer(unpack(lmao))
      local givmoneypls = {
         [1] = plr,
         [2] = math.floor(tonumber(params[3])/0.7)
      }
      game:GetService("Lighting").SendWarMoneyEvent:FireServer(unpack(givmoneypls))
      wait(1)
      msg(plr.Name.." has received "..params[3].." Cash.")
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
      local v = findPlayer(params[2])
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

function GodKill(params)
   if params[2] == "all" then
      for i,v in pairs(game.Players:GetPlayers()) do
         damn = v.Character.Humanoid

         local destroy = {
            [1] = damn,
            [2] = 0,
            [3] = 0,
            [4] = 0
         }

         game:GetService("Lighting").ThrowGrenadeEvent:FireServer(unpack(destroy))
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
      damn = game.Players.LocalPlayer.Character.Humanoid

      local destroy = {
         [1] = damn,
         [2] = 0,
         [3] = 0,
         [4] = 0
      }

      game:GetService("Lighting").ThrowGrenadeEvent:FireServer(unpack(destroy))
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
      damn = getplr.Character.Humanoid

      local destroy = {
         [1] = damn,
         [2] = 0,
         [3] = 0,
         [4] = 0
      }

      game:GetService("Lighting").ThrowGrenadeEvent:FireServer(unpack(destroy))
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
            damn = players.Character.Humanoid

            local destroy = {
               [1] = damn,
               [2] = 0,
               [3] = 0,
               [4] = 0
            }

            game:GetService("Lighting").ThrowGrenadeEvent:FireServer(unpack(destroy))
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
      local v = findPlayer(params[2])
      damn = v.Character.Humanoid

      local destroy = {
         [1] = damn,
         [2] = 0,
         [3] = 0,
         [4] = 0
      }

      game:GetService("Lighting").ThrowGrenadeEvent:FireServer(unpack(destroy))
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

function Godmode(params)
   if params[2] == "all" then
      for _,v in pairs(game.Players:GetPlayers()) do
         local args = {
            [1] = v.Character.Humanoid,
            [2] = -math.huge

         }
         game:GetService("Lighting").knifeEvent:FireServer(unpack(args))
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
      local args = {
         [1] = game:GetService("Players").LocalPlayer.Character.Humanoid,
         [2] = -math.huge
      }
      game:GetService("Lighting").knifeEvent:FireServer(unpack(args))
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
            local args = {
               [1] = others.Character.Humanoid,
               [2] = -math.huge
            }
            game:GetService("Lighting").knifeEvent:FireServer(unpack(args))
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
      local args = {
         [1] = getplr.Character.Humanoid,
         [2] = -math.huge
      }
      game:GetService("Lighting").knifeEvent:FireServer(unpack(args))
      wait(1)
      local properties = {
         Color = Color3.fromRGB(0, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = getplr.Name.." is now invincible."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   else
      local v = findPlayer(params[2])
      local args = {
         [1] = v.Character.Humanoid,
         [2] = -math.huge
      }
      game:GetService("Lighting").knifeEvent:FireServer(unpack(args))
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
         Color = Color3.fromRGB(0, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = v.Name.." is healed now."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   else
      local v = findPlayer(params[2])
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
         Color = Color3.fromRGB(0, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = v.Name.." is healed now."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   end
end

function GiveHP(params)
   if params[2] == "all" then
      for _,v in pairs(game.Players:GetPlayers()) do
         local args = {
            [1] = v.Character.Humanoid,
            [2] = -tonumber(params[3])

         }
         game:GetService("Lighting").knifeEvent:FireServer(unpack(args))
      end
      wait(1)
      msg("Everyone has gotten "..params[3].." HP.")
   elseif params[2] == "me" then
      local args = {
         [1] = game:GetService("Players").LocalPlayer.Character.Humanoid,
         [2] = -tonumber(params[3])

      }
      game:GetService("Lighting").knifeEvent:FireServer(unpack(args))
      wait(1)
      msg("You have gotten "..params[3].." HP.")
   elseif params[2] == "random" then
      local plr = findRandom()
      local args = {
         [1] = plr.Character.Humanoid,
         [2] = -tonumber(params[3])

      }
      game:GetService("Lighting").knifeEvent:FireServer(unpack(args))
      wait(1)
      msg(plr.Name.." has gotten "..params[3].." HP.")
   elseif params[2] == "others" then
      for _,v in pairs(game.Players:GetPlayers()) do
         if game.Players.LocalPlayer.Name ~= v.Name then
            local args = {
               [1] = v.Character.Humanoid,
               [2] = -tonumber(params[3])

            }
            game:GetService("Lighting").knifeEvent:FireServer(unpack(args))
         end
      end
      wait(1)
      msg("Other players have gotten "..params[3].." HP.")
   else
      local plr = findPlayer(params[2])
      local args = {
         [1] = plr.Character.Humanoid,
         [2] = -tonumber(params[3])

      }
      game:GetService("Lighting").knifeEvent:FireServer(unpack(args))
      wait(1)
      msg(plr.Name.." has gotten "..params[3].." HP.")
   end
end

function Rejoin()
   game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end

function ClearSky()
   v = game.Lighting.Sky

   local destroy = {
      [1] = v,
      [2] = 0,
      [3] = 0,
      [4] = 0
   }

   game:GetService("Lighting").ThrowGrenadeEvent:FireServer(unpack(destroy))
   wait(1)
   local properties = {
      Color = Color3.fromRGB(0, 255, 0);
      Font = Enum.Font.FredokaOne;
      TextSize = 16;
   }
   properties.Text = "Sky is clear now."
   game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
end

function Speed(params)
   if params[2] then
      local walkSpeed = params[2]


      local gmt = getrawmetatable(game)
      setreadonly(gmt, false)
      local oldindex = gmt.__index
      gmt.__index = newcclosure(function(self,b)
      if b == "WalkSpeed" then
         return 16
      end
      return oldindex(self,b)
      end)

      game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = walkSpeed
      wait(1)
      local properties = {
         Color = Color3.fromRGB(0, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = "Your speed has been changed to "..params[2].."."
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   end
end

function SGodmode(params, getmain)
   if params[2] == "all" then
      for _,v in pairs(game.Players:GetPlayers()) do
         local args = {
            [1] = v.Character.Humanoid,
            [2] = -math.huge

         }
         game:GetService("Lighting").knifeEvent:FireServer(unpack(args))
      end
      wait(1)
      local properties = {
         Color = Color3.fromRGB(0, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = "Everyone is now invincible. ("..getmain.Name..")"
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   elseif params[2] == "me" then
      local args = {
         [1] = getmain.Character.Humanoid,
         [2] = -math.huge
      }
      game:GetService("Lighting").knifeEvent:FireServer(unpack(args))
      wait(1)
      local properties = {
         Color = Color3.fromRGB(0, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = "You're now invincible. ("..getmain.Name..")"
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   elseif params[2] == "others" then
      local plr = getmain
      for _,others in pairs(game.Players:GetPlayers()) do
         if plr.Name ~= others.Name then
            local args = {
               [1] = others.Character.Humanoid,
               [2] = -math.huge
            }
            game:GetService("Lighting").knifeEvent:FireServer(unpack(args))
         end
      end
      wait(1)
      local properties = {
         Color = Color3.fromRGB(0, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = "Other players are now invincible. ("..getmain.Name..")"
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   elseif params[2] == "random" then
      local getrandom = math.random(1, #game.Players:GetPlayers())
      local getplr = game.Players:GetPlayers()[getrandom]
      local args = {
         [1] = getplr.Character.Humanoid,
         [2] = -math.huge
      }
      game:GetService("Lighting").knifeEvent:FireServer(unpack(args))
      wait(1)
      local properties = {
         Color = Color3.fromRGB(0, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = getplr.Name.." is now invincible. ("..getmain.Name..")"
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   else
      local v = findPlayer(params[2])
      local args = {
         [1] = v.Character.Humanoid,
         [2] = -math.huge
      }
      game:GetService("Lighting").knifeEvent:FireServer(unpack(args))
      wait(1)
      local properties = {
         Color = Color3.fromRGB(0, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = v.Name.." is now invincible. ("..getmain.Name..")"
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   end
end

function SKill(params, getmain)
   if params[2] == "all" then
      for i,v in pairs(game.Players:GetPlayers()) do
         local ayo = {
            [1] = game:GetService("Players")[v.Name].Character.Humanoid,
            [2] = math.huge
         }

         game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
      end
      wait(1)
      local properties = {
         Color = Color3.fromRGB(0, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = "Everyone has been killed. ("..getmain.Name..")"
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   elseif params[2] == "me" then
      local ayo = {
         [1] = getmain.Character.Humanoid,
         [2] = math.huge
      }

      game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
      wait(1)
      local properties = {
         Color = Color3.fromRGB(0, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = "You have been killed. ("..getmain.Name..")"
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
         Color = Color3.fromRGB(0, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = getplr.Name.." has been killed. ("..getmain.Name..")"
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   elseif params[2] == "others" then
      for _,players in pairs(game.Players:GetPlayers()) do
         if getmain.Name ~= players.Name then
            local ayo = {
               [1] = game:GetService("Players")[players.Name].Character.Humanoid,
               [2] = math.huge
            }

            game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
         end
      end
      wait(1)
      local properties = {
         Color = Color3.fromRGB(0, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = "Other players were killed. ("..getmain.Name..")"
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   else
      local v = findPlayer(params[2])
      local ayo = {
         [1] = game:GetService("Players")[v.Name].Character.Humanoid,
         [2] = math.huge
      }

      game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
      wait(1)
      local properties = {
         Color = Color3.fromRGB(0, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = v.Name.." has been killed. ("..getmain.Name..")"
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   end
end

function SGiveMoney(params, getmain)
   if params[2] == "all" then
      for _, v in pairs(game.Players:GetPlayers()) do
         local lmao = {
            [1] = -math.floor(tonumber(params[3])/0.7),
            [2] = "",
            [3] = game:GetService("Players").LocalPlayer,
            [4] = 0
         }
         game:GetService("Lighting").BuyMaskEvent:FireServer(unpack(lmao))
         local givmoneypls = {
            [1] = v,
            [2] = math.floor(tonumber(params[3])/0.7)
         }
         game:GetService("Lighting").SendWarMoneyEvent:FireServer(unpack(givmoneypls))
      end
      wait(1)
      msg("Everyone has received "..params[3].." Cash. ("..getmain.Name..")")
   elseif params[2] == "me" then
      local lmao = {
         [1] = -math.floor(tonumber(params[3])/0.7),
         [2] = "",
         [3] = game:GetService("Players").LocalPlayer,
         [4] = 0
      }
      game:GetService("Lighting").BuyMaskEvent:FireServer(unpack(lmao))
      local givmoneypls = {
         [1] = getmain,
         [2] = math.floor(tonumber(params[3])/0.7)
      }
      game:GetService("Lighting").SendWarMoneyEvent:FireServer(unpack(givmoneypls))
      wait(1)
      msg("You have received "..params[3].." Cash. ("..getmain.Name..")")
   elseif params[2] == "random" then
      local plr = findRandom()
      local lmao = {
         [1] = -math.floor(tonumber(params[3])/0.7),
         [2] = "",
         [3] = game:GetService("Players").LocalPlayer,
         [4] = 0
      }
      game:GetService("Lighting").BuyMaskEvent:FireServer(unpack(lmao))
      local givmoneypls = {
         [1] = plr,
         [2] = math.floor(tonumber(params[3])/0.7)
      }
      game:GetService("Lighting").SendWarMoneyEvent:FireServer(unpack(givmoneypls))
      wait(1)
      msg(plr.Name.." has received "..params[3].." Cash. ("..getmain.Name..")")
   elseif params[2] == "others" then
      for _, v in pairs(game.Players:GetPlayers()) do
         if getmain.Name ~= v.Name then
            local lmao = {
               [1] = -math.floor(tonumber(params[3])/0.7),
               [2] = "",
               [3] = game:GetService("Players").LocalPlayer,
               [4] = 0
            }
            game:GetService("Lighting").BuyMaskEvent:FireServer(unpack(lmao))
            local givmoneypls = {
               [1] = v,
               [2] = math.floor(tonumber(params[3])/0.7)
            }
            game:GetService("Lighting").SendWarMoneyEvent:FireServer(unpack(givmoneypls))
         end
      end
      wait(1)
      msg("Other players has received "..params[3].." Cash. ("..getmain.Name..")")
   else
      local plr = findPlayer(params[2])
      local lmao = {
         [1] = -math.floor(tonumber(params[3])/0.7),
         [2] = "",
         [3] = game:GetService("Players").LocalPlayer,
         [4] = 0
      }
      game:GetService("Lighting").BuyMaskEvent:FireServer(unpack(lmao))
      local givmoneypls = {
         [1] = plr,
         [2] = math.floor(tonumber(params[3])/0.7)
      }
      game:GetService("Lighting").SendWarMoneyEvent:FireServer(unpack(givmoneypls))
      wait(1)
      msg(plr.Name.." has received "..params[3].." Cash. ("..getmain.Name..")")
   end
end

function KillTeam(params)
   if params[2]:lower() == "german" then
      for i,v in pairs(game.Players:GetPlayers()) do
         if v.TeamColor == game:GetService("Teams").German.TeamColor then
            local ayo = {
               [1] = v.Character.Humanoid,
               [2] = math.huge
            }

            game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
         end
      end
      wait(1)
      msg("German team has been killed.")
   elseif params[2]:lower() == "ussr" then
      for i,v in pairs(game.Players:GetPlayers()) do
         if v.TeamColor == game:GetService("Teams").USSR.TeamColor then
            local ayo = {
               [1] = v.Character.Humanoid,
               [2] = math.huge
            }

            game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
         end
      end
      wait(1)
      msg("USSR team has been killed.")
   elseif params[2]:lower() == "usa" then
      for i,v in pairs(game.Players:GetPlayers()) do
         if v.TeamColor == game:GetService("Teams").USA.TeamColor then
            local ayo = {
               [1] = v.Character.Humanoid,
               [2] = math.huge
            }

            game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
         end
      end
      wait(1)
      msg("USA team has been killed.")
   elseif params[2]:lower() == "japan" then
      for i,v in pairs(game.Players:GetPlayers()) do
         if v.TeamColor == game:GetService("Teams")["Japanese Empire"].TeamColor then
            local ayo = {
               [1] = v.Character.Humanoid,
               [2] = math.huge
            }

            game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
         end
      end
      wait(1)
      msg("Japanese Empire team has been killed.")
   end
end

function SKillTeam(params, getmain)
   if params[2]:lower() == "german" then
      for i,v in pairs(game.Players:GetPlayers()) do
         if v.TeamColor == game:GetService("Teams").German.TeamColor then
            local ayo = {
               [1] = v.Character.Humanoid,
               [2] = math.huge
            }

            game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
         end
      end
      wait(1)
      msg("German team has been killed. ("..getmain.Name..")")
   elseif params[2]:lower() == "ussr" then
      for i,v in pairs(game.Players:GetPlayers()) do
         if v.TeamColor == game:GetService("Teams").USSR.TeamColor then
            local ayo = {
               [1] = v.Character.Humanoid,
               [2] = math.huge
            }

            game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
         end
      end
      wait(1)
      msg("USSR team has been killed. ("..getmain.Name..")")
   elseif params[2]:lower() == "usa" then
      for i,v in pairs(game.Players:GetPlayers()) do
         if v.TeamColor == game:GetService("Teams").USA.TeamColor then
            local ayo = {
               [1] = v.Character.Humanoid,
               [2] = math.huge
            }

            game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
         end
      end
      wait(1)
      msg("USA team has been killed. ("..getmain.Name..")")
   elseif params[2]:lower() == "japan" then
      for i,v in pairs(game.Players:GetPlayers()) do
         if v.TeamColor == game:GetService("Teams")["Japanese Empire"].TeamColor then
            local ayo = {
               [1] = v.Character.Humanoid,
               [2] = math.huge
            }

            game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
         end
      end
      wait(1)
      msg("Japanese Empire team has been killed. ("..getmain.Name..")")
   end
end

function Rank(params)
   local gymbro = findPlayer(params[2])
   if _G.rankedPlayers[tostring(gymbro.UserId)] then
      _G.rankedPlayers[tostring(gymbro.UserId)] = true
   else
      table.insert(_G.rankedPlayers, tostring(gymbro.UserId))
      _G.rankedPlayers[tostring(gymbro.UserId)] = true
   end
   gymbro.Chatted:Connect(function(msg)
   if _G.rankedPlayers[tostring(gymbro.UserId)] == true then
      local args = string.split(msg, " ")
      local cmd = args[1]:lower()
      if cmd == "/kill" or cmd == "/k" then
         SKill(args, gymbro)
      elseif cmd == "/god" then
         SGodmode(args, gymbro)
      elseif cmd == "/givemoney" or cmd == "/addmoney" or cmd == "/give" then
         SGiveMoney(args, gymbro)
      elseif cmd == "/killteam" or cmd == "/killt" or cmd == "/kt" then
         SKillTeam(args, gymbro)
      end
   end
   end)
   wait(1)
   msg("Ranked "..gymbro.Name)
end

function UnRank(args)
   local plr = findPlayer(args[2])
   _G.rankedPlayers[tostring(plr.UserId)] = false
   wait(1)
   msg("Unranked "..plr.Name)
end

game.Players.LocalPlayer.Chatted:Connect(function(msg)
local args = string.split(msg, " ")
local cmd = args[1]:lower()
if cmd == "/kill" or cmd == "/k" then
   Kill(args)
elseif cmd == "/godkill" or cmd == "/gkill" then
   GodKill(args)
elseif cmd == "/givemoney" or cmd == "/addmoney" or cmd == "/give" then
   GiveMoney(args)
elseif cmd == "/tp" then
   Teleport(args)
elseif cmd == "/god" then
   Godmode(args)
elseif cmd == "/heal" then
   Heal(args)
elseif cmd == "/speed" then
   Speed(args)
elseif cmd == "/givehp" or cmd == "/hp" then
   GiveHP(args)
elseif cmd == "/cmds" or cmd == "/help" then
   CommandsList()
elseif cmd == "/rejoin" or cmd == "/rj" then
   Rejoin()
elseif cmd == "/clearsky" or cmd == "/removesky" or cmd == "/deletesky" then
   ClearSky()
elseif cmd == "/rank" then
   Rank(args)
elseif cmd == "/unrank" then
   UnRank(args)
elseif cmd == "/killteam" or cmd == "/killt" or cmd == "/kt" then
   KillTeam(args)
end
end)

_G.rankedPlayers = {}

game:GetService("StarterGui"):SetCore("SendNotification",
{
   Title = "Admin Commands",
   Text = "Loaded! Use /cmds to see every command. Made by Gerashino#8015",
   Duration = 3
}
)

msg("Script is now running! Use /cmds to see every command. Made by Gerashino#8015")
