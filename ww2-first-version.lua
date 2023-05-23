if not game:IsLoaded() then
   game.Loaded:Wait()
end

if game.PlaceId ~= 6317098971 then
   return
end

if _G.TankSimulator1Lol_game then
   return
end
_G.TankSimulator1Lol_game = true

local function findplr(plr)
   for _, v in pairs(game.Players:GetPlayers()) do
      if v.Name:lower():sub(1, #plr) == plr:lower() or v.DisplayName:lower():sub(1, #plr) == plr:lower() then
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
   msg(":kill [Player] (Aliases: k) - Kill any player you want.")
   msg(":teleport [Player] (Aliases: tp, tpo, goto) - Teleports you to any player you want.")
   msg(":rank [Player] - Rank someone.")
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
   if args[2] == "all" then
      for i = 1,45 do
         for _,v in pairs(game.Players:GetPlayers()) do
            local all={[1]=Vector3.new(0,0,0),[2]=CFrame.new(0,0,0),[3]=v.Character.Humanoid}
            game.ReplicatedStorage.Maxim.Seat.ToolScript.Maxim.RemoteEvent:FireServer(unpack(all))
         end
      end
      wait(1)
      msg("Everyone have been killed.")
   elseif args[2] == "me" then
      game.Players.LocalPlayer.Character:BreakJoints()
      wait(1)
      msg("You have been killed.")
   elseif args[2] == "others" then
      for i = 1,45 do
         for _,v in pairs(game.Players:GetPlayers()) do
            if game.Players.LocalPlayer.Name ~= v.Name then
               local others={[1]=Vector3.new(0,0,0),[2]=CFrame.new(0,0,0),[3]=v.Character.Humanoid}
               game.ReplicatedStorage.Maxim.Seat.ToolScript.Maxim.RemoteEvent:FireServer(unpack(others))
            end
         end
      end
      wait(1)
      msg("Other players were killed.")
   elseif args[2] == "random" then
      local plr = findrandomplr()
      for i = 1,45 do
         local random={[1]=Vector3.new(0,0,0),[2]=CFrame.new(0,0,0),[3]=plr.Character.Humanoid}
         game.ReplicatedStorage.Maxim.Seat.ToolScript.Maxim.RemoteEvent:FireServer(unpack(random))
      end
      wait(1)
      msg("Killed "..plr.Name)
   else
      local plr = findplr(args[2])
      for i = 1,45 do
         local idksomeguy={[1]=Vector3.new(0,0,0),[2]=CFrame.new(0,0,0),[3]=plr.Character.Humanoid}
         game.ReplicatedStorage.Maxim.Seat.ToolScript.Maxim.RemoteEvent:FireServer(unpack(idksomeguy))
      end
      wait(1)
      msg("Killed "..plr.Name)
   end
end

function Teleport(args)
   if args[2] == "random" then
      local plr = findrandomplr()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
      wait(1)
      msg("Teleporting to "..plr.Name..".")
   else
      local plr = findplr(args[2])
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
      wait(1)
      msg("Teleporting to "..plr.Name..".")
   end
end

function SKill(args, getmain)
   if args[2] == "all" then
      for i = 1,45 do
         for _,v in pairs(game.Players:GetPlayers()) do
            local all={[1]=Vector3.new(0,0,0),[2]=CFrame.new(0,0,0),[3]=v.Character.Humanoid}
            game.ReplicatedStorage.Maxim.Seat.ToolScript.Maxim.RemoteEvent:FireServer(unpack(all))
         end
      end
      wait(1)
      msg("Everyone have been killed. ("..getmain.Name..")")
   elseif args[2] == "me" then
      game.Players.LocalPlayer.Character:BreakJoints()
      wait(1)
      msg("You have been killed. ("..getmain.Name..")")
   elseif args[2] == "others" then
      for i = 1,45 do
         for _,v in pairs(game.Players:GetPlayers()) do
            if game.Players.LocalPlayer.Name ~= v.Name then
               local others={[1]=Vector3.new(0,0,0),[2]=CFrame.new(0,0,0),[3]=v.Character.Humanoid}
               game.ReplicatedStorage.Maxim.Seat.ToolScript.Maxim.RemoteEvent:FireServer(unpack(others))
            end
         end
      end
      wait(1)
      msg("Other players were killed. ("..getmain.Name..")")
   elseif args[2] == "random" then
      local plr = findrandomplr()
      for i = 1,45 do
         local random={[1]=Vector3.new(0,0,0),[2]=CFrame.new(0,0,0),[3]=plr.Character.Humanoid}
         game.ReplicatedStorage.Maxim.Seat.ToolScript.Maxim.RemoteEvent:FireServer(unpack(random))
      end
      wait(1)
      msg("Killed "..plr.Name.." ("..getmain.Name..")")
   else
      local plr = findplr(args[2])
      for i = 1,45 do
         local idksomeguy={[1]=Vector3.new(0,0,0),[2]=CFrame.new(0,0,0),[3]=plr.Character.Humanoid}
         game.ReplicatedStorage.Maxim.Seat.ToolScript.Maxim.RemoteEvent:FireServer(unpack(idksomeguy))
      end
      wait(1)
      msg("Killed "..plr.Name.." ("..getmain.Name..")")
   end
end

function Rank(args)
   local gymbro = findplr(args[2])
   gymbro.Chatted:Connect(function(_MESSAGE)
   local _ARGUMENTS = _MESSAGE:split(" ")
   local _COMMAND = _ARGUMENTS[1]:lower()
   if _COMMAND == ":kill" or _COMMAND == ":k" then
      SKill(_ARGUMENTS, gymbro)
   end
   end)
   wait(1)
   msg("Ranked "..gymbro.Name)
end

game:GetService("Players").LocalPlayer.Chatted:Connect(function(_MESSAGE)
local _ARGUMENTS = _MESSAGE:split(" ")
local _COMMAND = _ARGUMENTS[1]:lower()
if _COMMAND == ":kill" or _COMMAND == ":k" then
   Kill(_ARGUMENTS)
elseif _COMMAND == ":tp" or _COMMAND == ":goto" or _COMMAND == ":tpo" or _COMMAND == ":teleport" then
   Teleport(_ARGUMENTS)
elseif _COMMAND == ":rank" then
   Rank(_ARGUMENTS)
elseif _COMMAND == ":cmds" or _COMMAND == ":help" then
   CommandsList()
end
end)

game:GetService("StarterGui"):SetCore("SendNotification",
{
   Title = "WW2 (1st Ver) Admin Commands",
   Text = "Loaded! Use :cmds to see every command. Made by Gerashino#8015",
   Duration = 3
}
)

msg("Script is now running! Use :cmds to see every command. Made by Gerashino#8015")
end
