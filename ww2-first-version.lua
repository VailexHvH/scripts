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

function convertToString(value)
    if type(value) ~= "string" then
        value = tostring(value)
    end
    return value
end

local function findPlayer(player)
    for _, players in pairs(game.Players:GetPlayers()) do
        if players.Name:lower():sub(1, #player) == player:lower() or players.DisplayName:lower():sub(1, #player) == player:lower() then
            return players;
        end
    end
    return nil
end

local function findRandomPlayer()
   return game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]
end

function sendMsg(_TEXT)
   local properties = {
      Color = Color3.fromRGB(0, 255, 0);
      Font = Enum.Font.FredokaOne;
      TextSize = 16;
   }
   properties.Text = _TEXT
   game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
end

function Help()
   wait(1)
   sendMsg("Commands:")
   sendMsg(":kill [Player] (Aliases: k) - Kill any player you want.")
   sendMsg(":teleport [Player] (Aliases: tp, tpo, goto) - Teleports you to any player you want.")
   sendMsg(":rank [Player] - Rank player.")
   sendMsg(":unrank [Player] - UnRank player.")
   sendMsg(":deadlytouch (Aliases: dt, lk, loopk) - Every object in the game will become deadly. Except for you.")
end

pcall(function()
    function scanInWorkspace(placeToScan)
        for _,object in pairs(placeToScan:GetChildren()) do
            scanInWorkspace(object)
            if object:IsA("Model") and object.Name == "Model" then
                local maxim = object:FindFirstChild "Maxim"
                if maxim then
                    maxim.Parent = game.ReplicatedStorage
                    break
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
      sendMsg("Everyone have been killed.")
   elseif args[2] == "me" then
      game.Players.LocalPlayer.Character:BreakJoints()
      wait(1)
      sendMsg("You have been killed.")
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
      sendMsg("Other players were killed.")
   elseif args[2] == "random" then
      local plr = findRandomPlayer()
      for i = 1,45 do
         local random={[1]=Vector3.new(0,0,0),[2]=CFrame.new(0,0,0),[3]=plr.Character.Humanoid}
         game.ReplicatedStorage.Maxim.Seat.ToolScript.Maxim.RemoteEvent:FireServer(unpack(random))
      end
      wait(1)
      sendMsg("Killed "..plr.Name.." ("..plr.DisplayName..")")
   else
      local plr = findPlayer(args[2])
      for i = 1,45 do
         local idksomeguy={[1]=Vector3.new(0,0,0),[2]=CFrame.new(0,0,0),[3]=plr.Character.Humanoid}
         game.ReplicatedStorage.Maxim.Seat.ToolScript.Maxim.RemoteEvent:FireServer(unpack(idksomeguy))
      end
      wait(1)
      sendMsg("Killed "..plr.Name.." ("..plr.DisplayName..")")
   end
end

function Teleport(args)
   if args[2] == "random" then
      local plr = findRandomPlayer()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
      wait(1)
      sendMsg("Teleporting to "..plr.Name.." ("..plr.DisplayName..")")
   else
      local plr = findPlayer(args[2])
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
      wait(1)
      sendMsg("Teleporting to "..plr.Name.." ("..plr.DisplayName..")")
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
      sendMsg("Everyone have been killed. ("..getmain.Name..")")
   elseif args[2] == "me" then
      for i = 1,45 do
         local me={[1]=Vector3.new(0,0,0),[2]=CFrame.new(0,0,0),[3]=getmain.Character.Humanoid}
         game.ReplicatedStorage.Maxim.Seat.ToolScript.Maxim.RemoteEvent:FireServer(unpack(me))
      end
      wait(1)
      sendMsg("You have been killed. ("..getmain.Name..")")
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
      sendMsg("Other players were killed. ("..getmain.Name..")")
   elseif args[2] == "random" then
      local plr = findRandomPlayer()
      for i = 1,45 do
         local random={[1]=Vector3.new(0,0,0),[2]=CFrame.new(0,0,0),[3]=plr.Character.Humanoid}
         game.ReplicatedStorage.Maxim.Seat.ToolScript.Maxim.RemoteEvent:FireServer(unpack(random))
      end
      wait(1)
      sendMsg("Killed "..plr.Name.." ("..plr.DisplayName..") ("..getmain.Name..")")
   else
      local plr = findPlayer(args[2])
      for i = 1,45 do
         local idksomeguy={[1]=Vector3.new(0,0,0),[2]=CFrame.new(0,0,0),[3]=plr.Character.Humanoid}
         game.ReplicatedStorage.Maxim.Seat.ToolScript.Maxim.RemoteEvent:FireServer(unpack(idksomeguy))
      end
      wait(1)
      sendMsg("Killed "..plr.Name.." ("..plr.DisplayName..") ("..getmain.Name..")")
   end
end

function Rank(args)
    local rankedPlayer = findPlayer(args[2])
    if _G.rankedPlayers[tostring(rankedPlayer.UserId)] then
        _G.rankedPlayers[tostring(rankedPlayer.UserId)] = true
    else
        table.insert(_G.rankedPlayers, tostring(rankedPlayer.UserId))
        _G.rankedPlayers[tostring(rankedPlayer.UserId)] = true
    end
    rankedPlayer.Chatted:Connect(function(_MESSAGE)
        if _G.rankedPlayers[tostring(rankedPlayer.UserId)] == true then
            local _ARGUMENTS = _MESSAGE:split(" ")
            local _COMMAND = _ARGUMENTS[1]:lower()
            if _COMMAND == ":kill" or _COMMAND == ":k" then
                SKill(_ARGUMENTS, rankedPlayer)
            end
        end
    end)
    wait(1)
    sendMsg("Ranked "..rankedPlayer.Name)
end

function UnRank(args)
    local plr = findPlayer(args[2])
    if _G.rankedPlayers[tostring(plr.UserId)] then
        _G.rankedPlayers[tostring(plr.UserId)] = false
        wait(1)
        sendMsg("Unranked "..plr.Name)
    else
        wait(1)
        sendMsg(plr.Name.." isn't ranked.")
    end
end

function DeadlyTouch()
    for _, T in next, workspace:GetDescendants() do
        pcall(function()
            T.Touched:Connect(function(hit)
                local plr = game.Players:GetPlayerFromCharacter(hit.Parent)
                if plr then
                    if plr.Name == game.Players.LocalPlayer.Name then
                        return
                    else
                        local kill={[1]=Vector3.new(0,0,0),[2]=CFrame.new(0,0,0),[3]=plr.Character.Humanoid}
                        game.ReplicatedStorage.Maxim.Seat.ToolScript.Maxim.RemoteEvent:FireServer(unpack(kill))
                    end
                end
            end)
        end)
    end
    wait(1)
    sendMsg("Every object is now deadly. Except for you.")
end

game:GetService("Players").LocalPlayer.Chatted:Connect(function(_MESSAGE)
    local _ARGUMENTS = _MESSAGE:split(" ")
    local _COMMAND = _ARGUMENTS[1]:lower()
    if _COMMAND == ":cmds" or _COMMAND == ":help" then
        Help()
    elseif _COMMAND == ":kill" or _COMMAND == ":k" then
        Kill(_ARGUMENTS)
    elseif _COMMAND == ":tp" or _COMMAND == ":goto" or _COMMAND == ":tpo" or _COMMAND == ":teleport" then
        Teleport(_ARGUMENTS)
    elseif _COMMAND == ":rank" then
        Rank(_ARGUMENTS)
    elseif _COMMAND == ":unrank" then
        UnRank(_ARGUMENTS)
    elseif _COMMAND == ":deadlytouch" or _COMMAND == ":dt" or _COMMAND == ":lk" or _COMMAND == ":loopk" then
        DeadlyTouch()
    end
end)

_G.rankedPlayers = {}

game:GetService("StarterGui"):SetCore("SendNotification",
    {
        Title = "WW2 (1st Ver) Admin Commands",
        Text = "Loaded! Use :cmds to see every command. Made by Gerashino#8015",
        Duration = 3
    }
)

sendMsg("Script is now running! Use :cmds to see every command. Made by Gerashino#8015")
