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
    for _, players in pairs(game:GetService("Players"):GetPlayers()) do
        if players.Name:lower():sub(1, #player) == player:lower() or players.DisplayName:lower():sub(1, #player) == player:lower() then
            return players;
        end
    end
    return nil
end

local function findRandomPlayer()
   return game:GetService("Players"):GetPlayers()[math.random(1, #game:GetService("Players"):GetPlayers())]
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
    sendMsg(":deadlytouch (Aliases: dt, lk, loopk, loopkill) - Every object in the game will become deadly. Except for you.")
    sendMsg(":toggledeadlytouch (Aliases: toggledt, tdt, dtt, deadlytouchtoggle, dttoggle) - Disable or Enable deadly touch.")
end

pcall(function()
    for _, object in pairs(game:GetService("Workspace"):FindFirstChild("ismap"):GetDescendants()) do
        if object.Parent:IsA("Model") and object.Parent.Name == "Model" and object.Name == "Maxim" then
            object.Parent = game:GetService("ReplicatedStorage")
            break
        end
    end
end)

function ExecuteEvent(Entity)
    for _, Main in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
        if Main.Name == "RemoteEvent" and Main:IsA("RemoteEvent") then
            local Execution = {
                [1] = Vector3.new(0, 0, 0),
                [2] = CFrame.new(0, 0, 0),
                [3] = Entity
            }
            Main:FireServer(unpack(Execution))
        end
    end
end

function Kill(args)
    if args[2] == "all" then
        for i = 1, 45 do
            for _, v in pairs(game:GetService("Players"):GetPlayers()) do
                ExecuteEvent(v.Character.Humanoid)
            end
        end
        wait(1)
        sendMsg("Everyone have been killed.")
    elseif args[2] == "me" then
        game:GetService("Players").LocalPlayer.Character:BreakJoints()
        wait(1)
        sendMsg("You have been killed.")
    elseif args[2] == "others" then
        for i = 1, 45 do
           for _, v in pairs(game:GetService("Players"):GetPlayers()) do
              if game:GetService("Players").LocalPlayer.Name ~= v.Name then
                 ExecuteEvent(v.Character.Humanoid)
              end
           end
        end
        wait(1)
        sendMsg("Other players were killed.")
    elseif args[2] == "random" then
        local plr = findRandomPlayer()
        for i = 1, 45 do
            ExecuteEvent(plr.Character.Humanoid)
        end
        wait(1)
        sendMsg("Killed "..plr.Name.." ("..plr.DisplayName..")")
    else
        local plr = findPlayer(args[2])
        for i = 1, 45 do
            ExecuteEvent(plr.Character.Humanoid)
        end
        wait(1)
        sendMsg("Killed "..plr.Name.." ("..plr.DisplayName..")")
    end
end

function Teleport(args)
   if args[2] == "random" then
      local plr = findRandomPlayer()
      game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
      wait(1)
      sendMsg("Teleporting to "..plr.Name.." ("..plr.DisplayName..")")
   else
      local plr = findPlayer(args[2])
      game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
      wait(1)
      sendMsg("Teleporting to "..plr.Name.." ("..plr.DisplayName..")")
   end
end

function SKill(args, getmain)
   if args[2] == "all" then
      for i = 1, 45 do
         for _, v in pairs(game:GetService("Players"):GetPlayers()) do
            ExecuteEvent(v.Character.Humanoid)
         end
      end
      wait(1)
      sendMsg("Everyone have been killed. ("..getmain.Name..")")
   elseif args[2] == "me" then
      for i = 1, 45 do
         ExecuteEvent(getmain.Character.Humanoid)
      end
      wait(1)
      sendMsg("You have been killed. ("..getmain.Name..")")
   elseif args[2] == "others" then
      for i = 1, 45 do
         for _, v in pairs(game:GetService("Players"):GetPlayers()) do
            if game:GetService("Players").LocalPlayer.Name ~= v.Name then
               ExecuteEvent(v.Character.Humanoid)
            end
         end
      end
      wait(1)
      sendMsg("Other players were killed. ("..getmain.Name..")")
   elseif args[2] == "random" then
      local plr = findRandomPlayer()
      for i = 1, 45 do
         ExecuteEvent(plr.Character.Humanoid)
      end
      wait(1)
      sendMsg("Killed "..plr.Name.." ("..plr.DisplayName..") ("..getmain.Name..")")
   else
      local plr = findPlayer(args[2])
      for i = 1, 45 do
         ExecuteEvent(plr.Character.Humanoid)
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
    if _G.DTRunning == true then
        sendMsg("Deadly touch was already executed.")
        return
    end
    _G.DTRunning = true
    for _, T in next, workspace:GetDescendants() do
        pcall(function()
            T.Touched:Connect(function(hit)
                if _G.DT == false then return end
                local plr = game:GetService("Players"):GetPlayerFromCharacter(hit.Parent)
                if plr then
                    if plr.Name == game:GetService("Players").LocalPlayer.Name then
                        return
                    else
                        ExecuteEvent(plr.Character.Humanoid)
                    end
                end
            end)
        end)
    end
    wait(1)
    sendMsg("Every object is now deadly. Except for you.")
end

function ToggleDeadlyTouch()
    if _G.DT == true then
        _G.DT = false
        wait(1)
        sendMsg("Disabled Deadly Touch.")
    else
        _G.DT = true
        wait(1)
        sendMsg("Enabled Deadly Touch.")
    end
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
    elseif _COMMAND == ":deadlytouch" or _COMMAND == ":dt" or _COMMAND == ":lk" or _COMMAND == ":loopk" or _COMMAND == ":loopkill" then
        DeadlyTouch()
    elseif _COMMAND == ":toggledeadlytouch" or _COMMAND == ":toggledt" or _COMMAND == ":tdt" or _COMMAND == ":dtt" or _COMMAND == ":deadlytouchtoggle" or _COMMAND == ":dttoggle" then
        ToggleDeadlyTouch()
    end
end)

_G.rankedPlayers = {}
_G.DT = true

game:GetService("StarterGui"):SetCore("SendNotification",
    {
        Title = "WW2 (1st Ver) Admin Commands",
        Text = "Loaded! Use :cmds to see every command. Made by Gerashino (ge_r)",
        Duration = 3
    }
)

sendMsg("Script is now running! Use :cmds to see every command. Made by Gerashino (ge_r)")
