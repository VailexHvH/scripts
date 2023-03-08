if game.PlaceId == 6317098971 then

   local function findplr(plr)
      for _, v in pairs(game.Players:GetPlayers()) do
         if v.Name:lower():sub(1, #plr) == plr:lower() then
            return v;
         end
      end
      return nil
   end

   local function findrandomplr()
      return game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]
   end

   function msg(text)
      local properties = {
         Color = Color3.new(12, 255, 0);
         Font = Enum.Font.FredokaOne;
         TextSize = 16;
      }
      properties.Text = text
      game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
   end

   function CommandsList()
      wait(1)
      msg("Commands:")
      msg("/e kill (Aliases: k) - Kill any player you want.")
   end

   pcall(function()
   function scanInWorkspace(placeToScan)
      for _,object in pairs(placeToScan:GetChildren()) do
         scanInWorkspace(object)
         if object:IsA("Model") and object.Name == "Model" then
            local maxim = object:FindFirstChild "Maxim"
            if maxim then
               maxim.Parent = game.ReplicatedStorage
            end
         end
      end
   end
   scanInWorkspace(workspace.ismap)
   end)

   function Kill(args)
      if args[3] == "all" then
         for i = 1,15 do
            for i,v in pairs(game.Players:GetPlayers()) do
               local all={[1]=Vector3.new(0,0,0),[2]=CFrame.new(0,0,0),[3]=v.Character.HumanoidRootPart}
               game.ReplicatedStorage.Maxim.Seat.ToolScript.Maxim.RemoteEvent:FireServer(unpack(all))
            end
         end
         wait(1)
         msg("Everyone have been killed.")
      elseif args[3] == "me" then
         game.Players.LocalPlayer.Character:BreakJoints()
         wait(1)
         msg("You have been killed.")
      elseif args[3] == "others" then
         for i = 1,15 do
            for i,v in pairs(game.Players:GetPlayers()) do
               if game.Players.LocalPlayer.Name ~= v.Name then
                  local others={[1]=Vector3.new(0,0,0),[2]=CFrame.new(0,0,0),[3]=v.Character.HumanoidRootPart}
                  game.ReplicatedStorage.Maxim.Seat.ToolScript.Maxim.RemoteEvent:FireServer(unpack(others))
               end
            end
         end
         wait(1)
         msg("Other players were killed.")
      elseif args[3] == "random" then
         local plr = findrandomplr()
         for i = 1,15 do
               local random={[1]=Vector3.new(0,0,0),[2]=CFrame.new(0,0,0),[3]=plr.Character.HumanoidRootPart}
               game.ReplicatedStorage.Maxim.Seat.ToolScript.Maxim.RemoteEvent:FireServer(unpack(random))
         end
         wait(1)
         msg("Killed "..plr.Name)
      else
         local plr = findplr(args[3])
         for i = 1,15 do
               local idksomeguy={[1]=Vector3.new(0,0,0),[2]=CFrame.new(0,0,0),[3]=plr.Character.HumanoidRootPart}
               game.ReplicatedStorage.Maxim.Seat.ToolScript.Maxim.RemoteEvent:FireServer(unpack(idksomeguy))
         end
         wait(1)
         msg("Killed "..plr.Name)
      end
   end

   game:GetService("Players").LocalPlayer.Chatted:Connect(function(_MESSAGE)
   local _ARGUMENTS = _MESSAGE:split(" ")
   local _MAIN = _ARGUMENTS[1]:lower()
   local _COMMAND = _ARGUMENTS[2]:lower()
   if _MAIN == "/e" then
      if _COMMAND == "kill" or _COMMAND == "k" then
         Kill(_ARGUMENTS)
      elseif _COMMAND == "cmds" or _COMMAND == "help" then
         CommandsList()
      end
   end
   end)

   game:GetService("StarterGui"):SetCore("SendNotification",
   {
      Title = "WW2 (1st Ver) Admin Commands",
      Text = "Loaded! Use /e cmds to see every command. Made by Gerashino#8015",
      Duration = 3
   }
   )

   msg("Script is now running! Use /e cmds to see every command. Made by Gerashino#8015")

end
