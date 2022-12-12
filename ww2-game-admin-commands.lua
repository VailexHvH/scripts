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
         end
      elseif params[2] == "me" then
         local ayo = {
            [1] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [2] = math.huge
         }

         game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
      elseif params[2] == "random" then
         local getrandom = math.random(1, #game.Players:GetPlayers())
         local getplr = game.Players:GetPlayers()[getrandom]
         local ayo = {
            [1] = game:GetService("Players")[getplr.Name].Character.Humanoid,
            [2] = math.huge
         }

         game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
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
      else
         local ayo = {
            [1] = game:GetService("Players")[params[2]].Character.Humanoid,
            [2] = math.huge
         }

         game:GetService("Lighting").knifeEvent:FireServer(unpack(ayo))
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
   end

   function Teleport(params)
      if params[2] == "random" then
         local getrandom = math.random(1, #game.Players:GetPlayers())
         local getplr = game.Players:GetPlayers()[getrandom]
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[getplr.Name].Character.HumanoidRootPart.CFrame
      else
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[params[2]].Character.HumanoidRootPart.CFrame
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
         end
      elseif params[2] == "me" then
         local ayo = {
            [1] = 0,
            [2] = "Level4vest",
            [3] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [4] = math.huge
         }

         game:GetService("Lighting").BuyVestEvent:FireServer(unpack(ayo))
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
      else
         local ayo = {
            [1] = 0,
            [2] = "Level4vest",
            [3] = game:GetService("Players")[params[2]].Character.Humanoid,
            [4] = math.huge
         }

         game:GetService("Lighting").BuyVestEvent:FireServer(unpack(ayo))
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
      else
         local head = {
            [1] = game:GetService("Players")[params[2]].Character.CharacterHealth.Head,
            [2] = game:GetService("Players")[params[2]].Character.CharacterHealth
         }

         game:GetService("Lighting").UseBandageEvent:FireServer(unpack(head))
         local torso = {
            [1] = game:GetService("Players")[params[2]].Character.CharacterHealth.Torso,
            [2] = game:GetService("Players")[params[2]].Character.CharacterHealth
         }

         game:GetService("Lighting").UseBandageEvent:FireServer(unpack(torso))
         local rightarm = {
            [1] = game:GetService("Players")[params[2]].Character.CharacterHealth.RightArm,
            [2] = game:GetService("Players")[params[2]].Character.CharacterHealth
         }

         game:GetService("Lighting").UseBandageEvent:FireServer(unpack(rightarm))
         local leftarm = {
            [1] = game:GetService("Players")[params[2]].Character.CharacterHealth.LeftArm,
            [2] = game:GetService("Players")[params[2]].Character.CharacterHealth
         }

         game:GetService("Lighting").UseBandageEvent:FireServer(unpack(leftarm))
         local rightleg = {
            [1] = game:GetService("Players")[params[2]].Character.CharacterHealth.RightLeg,
            [2] = game:GetService("Players")[params[2]].Character.CharacterHealth
         }

         game:GetService("Lighting").UseBandageEvent:FireServer(unpack(rightleg))
         local leftleg = {
            [1] = game:GetService("Players")[params[2]].Character.CharacterHealth.LeftLeg,
            [2] = game:GetService("Players")[params[2]].Character.CharacterHealth
         }

         game:GetService("Lighting").UseBandageEvent:FireServer(unpack(leftleg))
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
         end
      elseif params[2] == "me" then
         local health = {
            [1] = 0,
            [2] = "Level4vest",
            [3] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [4] = params[3]
         }

         game:GetService("Lighting").BuyVestEvent:FireServer(unpack(health))
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
            end
         end
      else
         local health = {
            [1] = 0,
            [2] = "Level4vest",
            [3] = game:GetService("Players")[params[2]].Character.Humanoid,
            [4] = params[3]
         }

         game:GetService("Lighting").BuyVestEvent:FireServer(unpack(health))
      end
   end

   game.Players.LocalPlayer.Chatted:Connect(function(msg)
   local args = string.split(msg," ")
   if args[1] == "/kill" then
      Kill(args)
   elseif args[1] == "/givemoney" then
      GiveMoney(args)
   elseif args[1] == "/tp" then
      Teleport(args)
   elseif args[1] == "/god" then
      Godmode(args)
   elseif args[1] == "/heal" then
      Heal(args)
   elseif args[1] == "/givehp" then
      GiveHP(args)
   end
   end)

   --gameplaceid end
end
