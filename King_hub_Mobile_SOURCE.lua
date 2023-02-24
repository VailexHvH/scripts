local KingOnTop = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TH = Instance.new("TextButton")
local ENG = Instance.new("TextButton")
local L = Instance.new("TextLabel")
local Or = Instance.new("TextLabel")

KingOnTop.Name = "KingOnTop"
KingOnTop.Parent = game:WaitForChild("CoreGui")
KingOnTop.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = KingOnTop
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.Position = UDim2.new(0.323304534, 0, 0.479919642, 0)
Frame.Size = UDim2.new(0, 484, 0, 100)

TH.Name = "TH"
TH.Parent = Frame
TH.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TH.Size = UDim2.new(0, 138, 0, 99)
TH.Font = Enum.Font.SourceSans
TH.Text = "Thailand [ไทย]"
TH.TextColor3 = Color3.fromRGB(255, 0, 0)
TH.TextSize = 25.000
TH.MouseButton1Down:connect(function()
game:GetService("CoreGui").KingOnTop:Destroy()
wait()
loadstring(game:HttpGet("https://pastebin.com/raw/Ct05PRsH"))()
wait()
local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid")

if not fireproximityprompt then
    local msg = Instance.new("Message",workspace)
    msg.Text = "you have fireproximityprompt function bro get better executor"
    task.wait(6)
    msg:Destroy()
    error("no prox") 
end

function esp(what,color,core,name)
    local parts
    
    if typeof(what) == "Instance" then
        if what:IsA("Model") then
            parts = what:GetChildren()
        elseif what:IsA("BasePart") then
            parts = {what,table.unpack(what:GetChildren())}
        end
    elseif typeof(what) == "table" then
        parts = what
    end
    
    local bill
    local boxes = {}
    
    for i,v in pairs(parts) do
        if v:IsA("BasePart") then
            local box = Instance.new("BoxHandleAdornment")
            box.Size = v.Size
            box.AlwaysOnTop = true
            box.ZIndex = 1
            box.AdornCullingMode = Enum.AdornCullingMode.Never
            box.Color3 = color
            box.Transparency = 1
            box.Adornee = v
            box.Parent = game.CoreGui
            
            table.insert(boxes,box)
            
            task.spawn(function()
                while box do
                    if box.Adornee == nil or not box.Adornee:IsDescendantOf(workspace) then
                        box.Adornee = nil
                        box.Visible = false
                        box:Destroy()
                    end  
                    task.wait()
                end
            end)
        end
    end
    
    if core and name then
        bill = Instance.new("BillboardGui",game.CoreGui)
        bill.AlwaysOnTop = true
        bill.Size = UDim2.new(0,400,0,100)
        bill.Adornee = core
        bill.MaxDistance = 2000
        
        local mid = Instance.new("Frame",bill)
        mid.AnchorPoint = Vector2.new(0.5,0.5)
        mid.BackgroundColor3 = color
        mid.Size = UDim2.new(0,8,0,8)
        mid.Position = UDim2.new(0.5,0,0.5,0)
        Instance.new("UICorner",mid).CornerRadius = UDim.new(1,0)
        Instance.new("UIStroke",mid)
        
        local txt = Instance.new("TextLabel",bill)
        txt.AnchorPoint = Vector2.new(0.5,0.5)
        txt.BackgroundTransparency = 1
        txt.BackgroundColor3 = color
        txt.TextColor3 = color
        txt.Size = UDim2.new(1,0,0,20)
        txt.Position = UDim2.new(0.5,0,0.7,0)
        txt.Text = name
        Instance.new("UIStroke",txt)
        
        task.spawn(function()
            while bill do
                if bill.Adornee == nil or not bill.Adornee:IsDescendantOf(workspace) then
                    bill.Enabled = false
                    bill.Adornee = nil
                    bill:Destroy() 
                end  
                task.wait()
            end
        end)
    end
    
    local ret = {}
    
    ret.delete = function()
        for i,v in pairs(boxes) do
            v.Adornee = nil
            v.Visible = false
            v:Destroy()
        end
        
        if bill then
            bill.Enabled = false
            bill.Adornee = nil
            bill:Destroy() 
        end
    end
    
    return ret 
end

local entityinfo = game.ReplicatedStorage:WaitForChild("EntityInfo")
function message(text)
    local msg = Instance.new("Message",workspace)
    msg.Text = tostring(text)
    task.wait(5)
    msg:Destroy()
    
    --firesignal(entityinfo.Caption.OnClientEvent,tostring(text)) 
end

local flags = {
    speed = 0,
    espdoors = false,
    espkeys = false,
    espitems = false,
    espbooks = false,
    esprush = false,
    espchest = false,
    esplocker = false,
    esphumans = false,
    espgold = false,
    goldespvalue = 0,
    hintrush = false,
    light = false,
    instapp = false,
    noseek = false,
    nogates = false,
    nopuzzle = false,
    noa90 = false,
    noskeledoors = false,
    noscreech = false,
    getcode = false,
    roomsnolock = false,
    draweraura = false,
    autorooms = false,
}

local DELFLAGS = {table.unpack(flags)}
local esptable = {doors={},keys={},items={},books={},entity={},chests={},lockers={},people={},gold={}}

local CF = CFrame.new
local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
local ChaseStart = game:GetService("ReplicatedStorage").GameData.ChaseStart

if game:GetService("CoreGui"):FindFirstChild("KING HUB") then
   game:GetService("CoreGui"):FindFirstChild("KING HUB"):Destroy()
end
local UILib = loadstring(game:HttpGet('https://pastebin.com/raw/rmqhJWxq'))();
local notifications = loadstring(game:HttpGet(("https://pastebin.com/raw/CcenX7YB"),true))()
local win = UILib:Window("KING HUB | Doors [Beta]",Color3.fromRGB(102, 255, 153), Enum.KeyCode.RightControl)

local old
old = hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    local method = getnamecallmethod()
    
    if tostring(self) == 'Screech' and method == "FireServer" and getgenv().avoidsc then
        args[1] = true
        return old(self,unpack(args))
    end
    if tostring(self) == 'ClutchHeartbeat' and method == "FireServer" and getgenv().winhb then
        args[2] = true
        return old(self,unpack(args))
    end
    
    return old(self,...)
end)

workspace.DescendantAdded:Connect(function(v)
    task.wait(0.01)
    if (string.match(string.lower(v.Name),"seek") or string.match(string.lower(v.Name),"triggerse")) and getgenv().removearms then
       v:Destroy()
    end
end)

local MainSection = win:Tab("LocalPlayer")
MainSection:Toggle("วิ่งเร็วขึ้น",false, function(SPEEDHACKER)
_G.BootsSpeed = SPEEDHACKER
end)

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.BootsSpeed then
            game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * 5/50)
        end
    end)
end)

MainSection:Toggle("เดินทะลุ [10%]",false, function(noclip)
        getgenv().col = noclip
       for i,v in next, game.Players.LocalPlayer.Character:GetDescendants() do
          if v.IsA(v,"BasePart") and getgenv().col == false then
             v.CanCollide = true
          elseif v.IsA(v,"BasePart") and getgenv().col == true then
            v.CanCollide = false
          end
       end
end)
local MainSection = win:Tab("Main")
MainSection:Toggle("สว่าง",false, function(v)
        if v then
            game:GetService("Lighting").Brightness = 2
            game:GetService("Lighting").ClockTime = 14
            game:GetService("Lighting").FogEnd = 100000
            game:GetService("Lighting").GlobalShadows = false
            game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        else
            game:GetService("Lighting").Brightness = 3
            game:GetService("Lighting").ClockTime = 20
            game:GetService("Lighting").FogEnd = 1.1111111533265e+16
            game:GetService("Lighting").GlobalShadows = true
            game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(0.5, 0.5, 0.5)
        end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.SeekES then
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").ChandelierObstruction:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").ChandelierObstruction:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").ChandelierObstruction:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
        end
    end)
end)


MainSection:Toggle("ลบ แขน Seek และ ไฟ",false, function(SeekESs)
_G.SeekES = SeekESs
end)

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.Gates then
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Gate"):Destroy()
        end
    end)
end)

MainSection:Toggle("ลบ ประตูรั้ว",false, function(Gatess)
_G.Gates = Gatess
end)

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.PuzzleD then
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Paintings:Destroy()
        end
    end)
end)

MainSection:Toggle("ลบ ประตูห้องวางรูป",false, function(PuzzleDs)
_G.PuzzleD = PuzzleDs
end)

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.SkeletonD then
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Wax_Door"):Destroy()
        end
    end)
end)

MainSection:Toggle("ลบ ประตูหัวกระโหลก",false, function(SkeletonDs)
_G.SkeletonD = SkeletonDs
end)

MainSection:Toggle("Screech ไม่มี ดาเมจ",false, function(noobfly)
        getgenv().avoidsc = noobfly
end)
MainSection:Toggle("ชนะมินิเกม Heartbeat ไม่ต้องกด",false, function(Heartbeat)
   getgenv().winhb = Heartbeat
end)

MainSection:Toggle("กดEโครตเร็วเลยคับพี่",false, function(noEwait)
        getgenv().noEwaits = noEwait
        PromptButtonHoldBegan = game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
            if getgenv().noEwaits then
			fireproximityprompt(prompt)
            end
		end)
end)

game:GetService("Workspace").CurrentRooms.DescendantAdded:Connect(function(v)
    if not getgenv().midd then return end
    if v.IsA(v,"ProximityPrompt") then
       if getgenv().midd then
        v.MaxActivationDistance = 20
       end
    end
end)

MainSection:Toggle("ประตูล่องหน",false, function(AGE)
if AGE then

_G.EZLODEST = true

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.EZLODEST then
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Transparency = 1
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Plate.Transparency = 1
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Knob.Transparency = 1
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Sign.Transparency = 1
        end
    end)
end)
        else

_G.EZLODEST = false

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.EZLODEST then
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Transparency = 1
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Plate.Transparency = 1
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Knob.Transparency = 1
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Sign.Transparency = 1
        end
    end)
end)

wait()

game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Transparency = 0
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Plate.Transparency = 0
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Knob.Transparency = 0
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Sign.Transparency = 0

end
end)

MainSection:Toggle("กด E อย่างไกล",false, function(MALE)
getgenv().midd = MALE
end)
MainSection:Toggle("ออโต้ เปิดลิ้นชัก",false, function(val)
    flags.draweraura = val
    
    if val then
        local function setup(room)
            local function check(v)
                if v:IsA("Model") then
                    if v.Name == "DrawerContainer" then
                        local knob = v:WaitForChild("Knobs")
                        
                        if knob then
                            local prompt = knob:WaitForChild("ActivateEventPrompt")
                            local interactions = prompt:GetAttribute("Interactions")
                            
                            if not interactions then
                                task.spawn(function()
                                    repeat task.wait(0.1)
                                        if plr:DistanceFromCharacter(knob.Position) <= 12 then
                                            fireproximityprompt(prompt)
                                        end
                                    until prompt:GetAttribute("Interactions") or not flags.draweraura
                                end)
                            end
                        end
                    elseif v.Name == "GoldPile" then
                        local prompt = v:WaitForChild("LootPrompt")
                        local interactions = prompt:GetAttribute("Interactions")
                            
                        if not interactions then
                            task.spawn(function()
                                repeat task.wait(0.1)
                                    if plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12 then
                                        fireproximityprompt(prompt) 
                                    end
                                until prompt:GetAttribute("Interactions") or not flags.draweraura
                            end)
                        end
                    elseif v.Name:sub(1,8) == "ChestBox" then
                        local prompt = v:WaitForChild("ActivateEventPrompt")
                        local interactions = prompt:GetAttribute("Interactions")
                        
                        if not interactions then
                            task.spawn(function()
                                repeat task.wait(0.1)
                                    if plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12 then
                                        fireproximityprompt(prompt)
                                    end
                                until prompt:GetAttribute("Interactions") or not flags.draweraura
                            end)
                        end
                    elseif v.Name == "RolltopContainer" then
                        local prompt = v:WaitForChild("ActivateEventPrompt")
                        local interactions = prompt:GetAttribute("Interactions")
                        
                        if not interactions then
                            task.spawn(function()
                                repeat task.wait(0.1)
                                    if plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12 then
                                        fireproximityprompt(prompt)
                                    end
                                until prompt:GetAttribute("Interactions") or not flags.draweraura
                            end)
                        end
                    end 
                end
            end
    
            local subaddcon
            subaddcon = room.DescendantAdded:Connect(function(v)
                check(v) 
            end)
            
            for i,v in pairs(room:GetDescendants()) do
                check(v)
            end
            
            task.spawn(function()
                repeat task.wait() until not flags.draweraura
                subaddcon:Disconnect() 
            end)
        end
        
        local addconnect
        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            setup(room)
        end)
        
        for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
            if room:FindFirstChild("Assets") then
                setup(room) 
            end
        end
        
        repeat task.wait() until not flags.draweraura
        addconnect:Disconnect()
    end
end)

local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

MainSection:Toggle("แจ้งเตือนอีเว้น",false, function(val)
    flags.hintrush = val
    
    if val then
        local addconnect
        addconnect = workspace.ChildAdded:Connect(function(v)
            if table.find(entitynames,v.Name) then
                repeat task.wait() until plr:DistanceFromCharacter(v:GetPivot().Position) < 1000 or not v:IsDescendantOf(workspace)
                
                if v:IsDescendantOf(workspace) then
            Notification:Notify(
    {Title = "KING HUB Notification [Beta]", Description = v.Name:gsub("Moving",""):lower().." มา ซ่อนดิรอไร!"},
    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"},
    {Image = "http://www.roblox.com/asset/?id=11677001091", ImageColor = Color3.fromRGB(255, 255, 255)}
)
                end
            end
        end) 
        
        repeat task.wait() until not flags.hintrush
        addconnect:Disconnect()
    end
end)

MainSection:Toggle("Seek แบบเก่า",false, function(Sekold)
if Sekold then

_G.EZLODES = true

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.EZLODES then
local Tuking = true
local TOOL = 1
local TOOLKing = 0

game:GetService("Workspace").SeekMoving.Figure.Transparency = TOOLKing
game:GetService("Workspace").SeekMoving.Figure.ParticleEmitter.Enabled = Tuking
game:GetService("Workspace").SeekMoving.Figure.Attachment.ParticleEmitter.Enabled = Tuking
game:GetService("Workspace").SeekMoving.SeekRig.UpperTorso.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftLowerArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightLowerLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightUpperArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightUpperLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightLowerArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftUpperLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LowerTorso.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Black.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Eye.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Eye.Decal.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftLowerLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftUpperArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.SeekPuddle.Transparency = TOOL
        end
    end)
end)
        else

_G.EZLODES = false

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.EZLODES then
local Tuking = true
local TOOL = 1
local TOOLKing = 0

game:GetService("Workspace").SeekMoving.Figure.Transparency = TOOLKing
game:GetService("Workspace").SeekMoving.Figure.ParticleEmitter.Enabled = Tuking
game:GetService("Workspace").SeekMoving.Figure.Attachment.ParticleEmitter.Enabled = Tuking
game:GetService("Workspace").SeekMoving.SeekRig.UpperTorso.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftLowerArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightLowerLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightUpperArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightUpperLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightLowerArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftUpperLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LowerTorso.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Black.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Eye.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Eye.Decal.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftLowerLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftUpperArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.SeekPuddle.Transparency = TOOL
        end
    end)
end)

wait()


local Tuking = false
local TOOL = 0
local TOOLKing = 1

game:GetService("Workspace").SeekMoving.Figure.Transparency = TOOLKing
game:GetService("Workspace").SeekMoving.Figure.ParticleEmitter.Enabled = Tuking
game:GetService("Workspace").SeekMoving.Figure.Attachment.ParticleEmitter.Enabled = Tuking
game:GetService("Workspace").SeekMoving.SeekRig.UpperTorso.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftLowerArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightLowerLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightUpperArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightUpperLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightLowerArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftUpperLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LowerTorso.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Black.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Eye.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Eye.Decal.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftLowerLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftUpperArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.SeekPuddle.Transparency = TOOL

end
end)

local a90remote = game.ReplicatedStorage:WaitForChild("EntityInfo"):WaitForChild("A90")

MainSection:Toggle("ไม่มี A-90 [The Rooms]",false, function(val)
        flags.noa90 = val
        
        if val  then
            local jumpscare = plr.PlayerGui:WaitForChild("MainUI"):WaitForChild("Jumpscare"):FindFirstChild("Jumpscare_A90")
           
            if jumpscare then
                jumpscare.Parent = nil
                
                a90remote.Parent = nil
                repeat task.wait()
                    game.SoundService.Main.Volume = 1 
                until not flags.noa90
                jumpscare.Parent = plr.PlayerGui.MainUI.Jumpscare
                a90remote.Parent = entityinfo 
            end
        end
end)

local ESP = win:Tab("ESP")

ESP:Toggle("ประตู",false, function(val)
    flags.espdoors = val
    
    if val then
        local function setup(room)
            local door = room:WaitForChild("Door"):WaitForChild("Door")
            
            task.wait(0.1)
            local h = esp(door,Color3.fromRGB(90,255,40),door,"ประตู")
            table.insert(esptable.doors,h)
            
            door:WaitForChild("Open").Played:Connect(function()
                h.delete()
            end)
            
            door.AncestryChanged:Connect(function()
                h.delete()
            end)
        end
        
        local addconnect
        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            setup(room)
        end)
        
        for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
            if room:FindFirstChild("Assets") then
                setup(room) 
            end
        end
        
        repeat task.wait() until not flags.espdoors
        addconnect:Disconnect()
        
        for i,v in pairs(esptable.doors) do
            v.delete()
        end 
    end
end)
ESP:Toggle("กุญแจ และ คันโยก",false, function(val)
    flags.espkeys = val
    
    if val then
        local function check(v)
            if v:IsA("Model") and (v.Name == "LeverForGate" or v.Name == "KeyObtain") then
                task.wait(0.1)
                if v.Name == "KeyObtain" then
                    local hitbox = v:WaitForChild("Hitbox")
                    local parts = hitbox:GetChildren()
                    table.remove(parts,table.find(parts,hitbox:WaitForChild("PromptHitbox")))
                    
                    local h = esp(parts,Color3.fromRGB(255,255,255),hitbox,"กุญแจ")
                    table.insert(esptable.keys,h)
                    
                elseif v.Name == "LeverForGate" then
                    local h = esp(v,Color3.fromRGB(255,255,255),v.PrimaryPart,"คันโยก")
                    table.insert(esptable.keys,h)
                    
                    v.PrimaryPart:WaitForChild("SoundToPlay").Played:Connect(function()
                        h.delete()
                    end) 
                end
            end
        end
        
        local function setup(room)
            local assets = room:WaitForChild("Assets")
            
            assets.DescendantAdded:Connect(function(v)
                check(v) 
            end)
                
            for i,v in pairs(assets:GetDescendants()) do
                check(v)
            end 
        end
        
        local addconnect
        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            setup(room)
        end)
        
        for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
            if room:FindFirstChild("Assets") then
                setup(room) 
            end
        end
        
        repeat task.wait() until not flags.espkeys
        addconnect:Disconnect()
        
        for i,v in pairs(esptable.keys) do
            v.delete()
        end 
    end
end)
ESP:Toggle("ไอเทม",false, function(val)
     flags.espitems = val
    
    if val then
        local function check(v)
            if v:IsA("Model") and (v:GetAttribute("Pickup") or v:GetAttribute("PropType")) then
                task.wait(0.1)
                
                local part = (v:FindFirstChild("Handle") or v:FindFirstChild("Prop"))
                local h = esp(part,Color3.fromRGB(255,255,255),part,v.Name)
                table.insert(esptable.items,h)
            end
        end
        
        local function setup(room)
            local assets = room:WaitForChild("Assets")
            
            if assets then  
                local subaddcon
                subaddcon = assets.DescendantAdded:Connect(function(v)
                    check(v) 
                end)
                
                for i,v in pairs(assets:GetDescendants()) do
                    check(v)
                end
                
                task.spawn(function()
                    repeat task.wait() until not flags.espitems
                    subaddcon:Disconnect()  
                end) 
            end 
        end
        
        local addconnect
        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            setup(room)
        end)
        
        for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
            if room:FindFirstChild("Assets") then
                setup(room) 
            end
        end
        
        repeat task.wait() until not flags.espitems
        addconnect:Disconnect()
        
        for i,v in pairs(esptable.items) do
            v.delete()
        end 
    end
end)
ESP:Toggle("หนังสือ",false, function(val)
    flags.espbooks = val
    
    if val then
        local function check(v)
            if v:IsA("Model") and (v.Name == "LiveHintBook" or v.Name == "LiveBreakerPolePickup") then
                task.wait(0.1)
                
                local h = esp(v,Color3.fromRGB(255,255,255),v.PrimaryPart,"หนังสือ")
                table.insert(esptable.books,h)
                
                v.AncestryChanged:Connect(function()
                    if not v:IsDescendantOf(room) then
                        h.delete() 
                    end
                end)
            end
        end
        
        local function setup(room)
            if room.Name == "50" or room.Name == "100" then
                room.DescendantAdded:Connect(function(v)
                    check(v) 
                end)
                
                for i,v in pairs(room:GetDescendants()) do
                    check(v)
                end
            end
        end
        
        local addconnect
        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            setup(room)
        end)
        
        for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
            setup(room) 
        end
        
        repeat task.wait() until not flags.espbooks
        addconnect:Disconnect()
        
        for i,v in pairs(esptable.books) do
            v.delete()
        end 
    end
end)

local entitynames = {"RushMoving","AmbushMoving","Snare","A60","A120"}

ESP:Toggle("สัตว์ประหลาด",false, function(val)
    flags.esprush = val
    
    if val then
        local addconnect
        addconnect = workspace.ChildAdded:Connect(function(v)
            if table.find(entitynames,v.Name) then
                task.wait(0.1)
                
                local h = esp(v,Color3.fromRGB(255,25,25),v.PrimaryPart,v.Name:gsub("Moving",""))
                table.insert(esptable.entity,h)
            end
        end)
        
        local function setup(room)
            if room.Name == "50" or room.Name == "100" then
                local figuresetup = room:WaitForChild("FigureSetup")
            
                if figuresetup then
                    local fig = figuresetup:WaitForChild("FigureRagdoll")
                    task.wait(0.1)
                    
                    local h = esp(fig,Color3.fromRGB(255,25,25),fig.PrimaryPart,"Figure")
                    table.insert(esptable.entity,h)
                end 
            else
                local assets = room:WaitForChild("Assets")
                
                local function check(v)
                    if v:IsA("Model") and table.find(entitynames,v.Name) then
                        task.wait(0.1)
                        
                        local h = esp(v:WaitForChild("Base"),Color3.fromRGB(255,25,25),v.Base,"Snare")
                        table.insert(esptable.entity,h)
                    end
                end
                
                assets.DescendantAdded:Connect(function(v)
                    check(v) 
                end)
                
                for i,v in pairs(assets:GetDescendants()) do
                    check(v)
                end
            end 
        end
        
        local roomconnect
        roomconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            setup(room)
        end)
        
        for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
            setup(room) 
        end
        
        repeat task.wait() until not flags.esprush
        addconnect:Disconnect()
        roomconnect:Disconnect()
        
        for i,v in pairs(esptable.entity) do
            v.delete()
        end 
    end
end)
ESP:Toggle("ตู้ และ ล็อคเกอร์",false, function(val)
    flags.esplocker = val
    
    if val then
        local function check(v)
            if v:IsA("Model") then
                task.wait(0.1)
                if v.Name == "Wardrobe" then
                    local h = esp(v.PrimaryPart,Color3.fromRGB(90,255,40),v.PrimaryPart,"ตู้")
                    table.insert(esptable.lockers,h) 
                elseif (v.Name == "Rooms_Locker" or v.Name == "Rooms_Locker_Fridge") then
                    local h = esp(v.PrimaryPart,Color3.fromRGB(90,255,40),v.PrimaryPart,"ล็อคเกอร์")
                    table.insert(esptable.lockers,h) 
                end
            end
        end
        
        local function setup(room)
            local assets = room:WaitForChild("Assets")
            
            if assets then
                local subaddcon
                subaddcon = assets.DescendantAdded:Connect(function(v)
                    check(v) 
                end)
                
                for i,v in pairs(assets:GetDescendants()) do
                    check(v)
                end
                
                task.spawn(function()
                    repeat task.wait() until not flags.esplocker
                    subaddcon:Disconnect()  
                end) 
            end 
        end
        
        local addconnect
        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            setup(room)
        end)
        
        for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
            setup(room) 
        end
        
        repeat task.wait() until not flags.esplocker
        addconnect:Disconnect()
        
        for i,v in pairs(esptable.lockers) do
            v.delete()
        end 
    end
end)


function isnil(thing)
    return (thing == nil)
end
local function round(n)
    return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
    for i,v in pairs(game:GetService'Players':GetChildren()) do
        pcall(function()
            if not isnil(v.Character) then
                if ESPPlayer then
                    if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui',v.Character.Head)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v.Character.Head
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "SourceSansBold"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        if v.Team == game.Players.LocalPlayer.Team then
                            name.TextColor3 = Color3.new(102, 255, 153)
                        else
                            name.TextColor3 = Color3.new(102, 255, 153)
                        end
                    else
                        v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
                    end
                else
                    if v.Character.Head:FindFirstChild('NameEsp'..Number) then
                        v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
                    end
                end
            end
        end)
    end
end

ESP:Toggle("ผู้เล่น [ชื่อ]",false, function(PLAYER)
    ESPPlayer = PLAYER
    while ESPPlayer do wait()
        UpdatePlayerChams()
    end
end)

ESP:Toggle("ผู้เล่น",false, function(ESPPLAYER)
getgenv().enabled = ESPPLAYER --Toggle on/off
getgenv().filluseteamcolor = false --Toggle fill color using player team color on/off
getgenv().outlineuseteamcolor = false --Toggle outline color using player team color on/off
getgenv().fillcolor = Color3.new(0, 0, 0) --Change fill color, no need to edit if using team color
getgenv().outlinecolor = Color3.new(1, 1, 1) --Change outline color, no need to edit if using team color
getgenv().filltrans = 0 --Change fill transparency
getgenv().outlinetrans = 0 --Change outline transparency

loadstring(game:HttpGet("https://raw.githubusercontent.com/zntly/highlight-esp/main/esp.lua"))()
end)
end)
ENG.Name = "ENG"
ENG.Parent = Frame
ENG.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ENG.Position = UDim2.new(0.671487629, 0, 0, 0)
ENG.Size = UDim2.new(0, 159, 0, 99)
ENG.Font = Enum.Font.SourceSans
ENG.Text = "English [อังกฤษ]"
ENG.TextColor3 = Color3.fromRGB(255, 0, 0)
ENG.TextSize = 29.000
ENG.MouseButton1Down:connect(function()
game:GetService("CoreGui").KingOnTop:Destroy()
wait()
loadstring(game:HttpGet("https://pastebin.com/raw/Ct05PRsH"))()
wait()
local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid")

if not fireproximityprompt then
    local msg = Instance.new("Message",workspace)
    msg.Text = "you have fireproximityprompt function bro get better executor"
    task.wait(6)
    msg:Destroy()
    error("no prox") 
end

function esp(what,color,core,name)
    local parts
    
    if typeof(what) == "Instance" then
        if what:IsA("Model") then
            parts = what:GetChildren()
        elseif what:IsA("BasePart") then
            parts = {what,table.unpack(what:GetChildren())}
        end
    elseif typeof(what) == "table" then
        parts = what
    end
    
    local bill
    local boxes = {}
    
    for i,v in pairs(parts) do
        if v:IsA("BasePart") then
            local box = Instance.new("BoxHandleAdornment")
            box.Size = v.Size
            box.AlwaysOnTop = true
            box.ZIndex = 1
            box.AdornCullingMode = Enum.AdornCullingMode.Never
            box.Color3 = color
            box.Transparency = 1
            box.Adornee = v
            box.Parent = game.CoreGui
            
            table.insert(boxes,box)
            
            task.spawn(function()
                while box do
                    if box.Adornee == nil or not box.Adornee:IsDescendantOf(workspace) then
                        box.Adornee = nil
                        box.Visible = false
                        box:Destroy()
                    end  
                    task.wait()
                end
            end)
        end
    end
    
    if core and name then
        bill = Instance.new("BillboardGui",game.CoreGui)
        bill.AlwaysOnTop = true
        bill.Size = UDim2.new(0,400,0,100)
        bill.Adornee = core
        bill.MaxDistance = 2000
        
        local mid = Instance.new("Frame",bill)
        mid.AnchorPoint = Vector2.new(0.5,0.5)
        mid.BackgroundColor3 = color
        mid.Size = UDim2.new(0,8,0,8)
        mid.Position = UDim2.new(0.5,0,0.5,0)
        Instance.new("UICorner",mid).CornerRadius = UDim.new(1,0)
        Instance.new("UIStroke",mid)
        
        local txt = Instance.new("TextLabel",bill)
        txt.AnchorPoint = Vector2.new(0.5,0.5)
        txt.BackgroundTransparency = 1
        txt.BackgroundColor3 = color
        txt.TextColor3 = color
        txt.Size = UDim2.new(1,0,0,20)
        txt.Position = UDim2.new(0.5,0,0.7,0)
        txt.Text = name
        Instance.new("UIStroke",txt)
        
        task.spawn(function()
            while bill do
                if bill.Adornee == nil or not bill.Adornee:IsDescendantOf(workspace) then
                    bill.Enabled = false
                    bill.Adornee = nil
                    bill:Destroy() 
                end  
                task.wait()
            end
        end)
    end
    
    local ret = {}
    
    ret.delete = function()
        for i,v in pairs(boxes) do
            v.Adornee = nil
            v.Visible = false
            v:Destroy()
        end
        
        if bill then
            bill.Enabled = false
            bill.Adornee = nil
            bill:Destroy() 
        end
    end
    
    return ret 
end

local entityinfo = game.ReplicatedStorage:WaitForChild("EntityInfo")
function message(text)
    local msg = Instance.new("Message",workspace)
    msg.Text = tostring(text)
    task.wait(5)
    msg:Destroy()
    
    --firesignal(entityinfo.Caption.OnClientEvent,tostring(text)) 
end

local flags = {
    speed = 0,
    espdoors = false,
    espkeys = false,
    espitems = false,
    espbooks = false,
    esprush = false,
    espchest = false,
    esplocker = false,
    esphumans = false,
    espgold = false,
    goldespvalue = 0,
    hintrush = false,
    light = false,
    instapp = false,
    noseek = false,
    nogates = false,
    nopuzzle = false,
    noa90 = false,
    noskeledoors = false,
    noscreech = false,
    getcode = false,
    roomsnolock = false,
    draweraura = false,
    autorooms = false,
}

local DELFLAGS = {table.unpack(flags)}
local esptable = {doors={},keys={},items={},books={},entity={},chests={},lockers={},people={},gold={}}

local CF = CFrame.new
local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
local ChaseStart = game:GetService("ReplicatedStorage").GameData.ChaseStart

if game:GetService("CoreGui"):FindFirstChild("KING HUB") then
   game:GetService("CoreGui"):FindFirstChild("KING HUB"):Destroy()
end
local UILib = loadstring(game:HttpGet('https://pastebin.com/raw/rmqhJWxq'))();
local notifications = loadstring(game:HttpGet(("https://pastebin.com/raw/CcenX7YB"),true))()
local win = UILib:Window("KING HUB | Doors [Beta]",Color3.fromRGB(102, 255, 153), Enum.KeyCode.RightControl)

local old
old = hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    local method = getnamecallmethod()
    
    if tostring(self) == 'Screech' and method == "FireServer" and getgenv().avoidsc then
        args[1] = true
        return old(self,unpack(args))
    end
    if tostring(self) == 'ClutchHeartbeat' and method == "FireServer" and getgenv().winhb then
        args[2] = true
        return old(self,unpack(args))
    end
    
    return old(self,...)
end)

workspace.DescendantAdded:Connect(function(v)
    task.wait(0.01)
    if (string.match(string.lower(v.Name),"seek") or string.match(string.lower(v.Name),"triggerse")) and getgenv().removearms then
       v:Destroy()
    end
end)

local MainSection = win:Tab("LocalPlayer")
MainSection:Toggle("Speed Boots",false, function(SPEEDHACKER)
_G.BootsSpeed = SPEEDHACKER
end)

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.BootsSpeed then
            game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * 5/50)
        end
    end)
end)

MainSection:Toggle("Noclip [10%]",false, function(noclip)
        getgenv().col = noclip
       for i,v in next, game.Players.LocalPlayer.Character:GetDescendants() do
          if v.IsA(v,"BasePart") and getgenv().col == false then
             v.CanCollide = true
          elseif v.IsA(v,"BasePart") and getgenv().col == true then
            v.CanCollide = false
          end
       end
end)
local MainSection = win:Tab("Main")
MainSection:Toggle("FullBright",false, function(v)
        if v then
            game:GetService("Lighting").Brightness = 2
            game:GetService("Lighting").ClockTime = 14
            game:GetService("Lighting").FogEnd = 100000
            game:GetService("Lighting").GlobalShadows = false
            game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        else
            game:GetService("Lighting").Brightness = 3
            game:GetService("Lighting").ClockTime = 20
            game:GetService("Lighting").FogEnd = 1.1111111533265e+16
            game:GetService("Lighting").GlobalShadows = true
            game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(0.5, 0.5, 0.5)
        end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.SeekES then
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").ChandelierObstruction:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").ChandelierObstruction:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").ChandelierObstruction:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Seek_Arm:Destroy()
        end
    end)
end)


MainSection:Toggle("Remove Seek Arms/Fire",false, function(SeekESs)
_G.SeekES = SeekESs
end)

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.Gates then
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Gate"):Destroy()
        end
    end)
end)

MainSection:Toggle("Remove Gate Doors",false, function(Gatess)
_G.Gates = Gatess
end)

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.PuzzleD then
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Paintings:Destroy()
        end
    end)
end)

MainSection:Toggle("Remove Puzzle Doors",false, function(PuzzleDs)
_G.PuzzleD = PuzzleDs
end)

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.SkeletonD then
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Wax_Door"):Destroy()
        end
    end)
end)

MainSection:Toggle("Remove Skeleton Door",false, function(SkeletonDs)
_G.SkeletonD = SkeletonDs
end)

MainSection:Toggle("Screech No Damage",false, function(noobfly)
        getgenv().avoidsc = noobfly
end)
MainSection:Toggle("Win Heartbeat",false, function(Heartbeat)
   getgenv().winhb = Heartbeat
end)

MainSection:Toggle("Instant Interract",false, function(noEwait)
        getgenv().noEwaits = noEwait
        PromptButtonHoldBegan = game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
            if getgenv().noEwaits then
			fireproximityprompt(prompt)
            end
		end)
end)
game:GetService("Workspace").CurrentRooms.DescendantAdded:Connect(function(v)
    if not getgenv().midd then return end
    if v.IsA(v,"ProximityPrompt") then
       if getgenv().midd then
        v.MaxActivationDistance = 20
       end
    end
end)

MainSection:Toggle("Invisible Doors",false, function(AGE)
if AGE then

_G.EZLODEST = true

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.EZLODEST then
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Transparency = 1
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Plate.Transparency = 1
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Knob.Transparency = 1
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Sign.Transparency = 1
        end
    end)
end)
        else

_G.EZLODEST = false

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.EZLODEST then
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Transparency = 1
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Plate.Transparency = 1
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Knob.Transparency = 1
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Sign.Transparency = 1
        end
    end)
end)

wait()

game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Transparency = 0
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Plate.Transparency = 0
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Knob.Transparency = 0
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").Door.Sign.Transparency = 0

end
end)

MainSection:Toggle("Press E Far",false, function(MALE)
getgenv().midd = MALE
end)
MainSection:Toggle("Auto Loot Containers",false, function(val)
    flags.draweraura = val
    
    if val then
        local function setup(room)
            local function check(v)
                if v:IsA("Model") then
                    if v.Name == "DrawerContainer" then
                        local knob = v:WaitForChild("Knobs")
                        
                        if knob then
                            local prompt = knob:WaitForChild("ActivateEventPrompt")
                            local interactions = prompt:GetAttribute("Interactions")
                            
                            if not interactions then
                                task.spawn(function()
                                    repeat task.wait(0.1)
                                        if plr:DistanceFromCharacter(knob.Position) <= 12 then
                                            fireproximityprompt(prompt)
                                        end
                                    until prompt:GetAttribute("Interactions") or not flags.draweraura
                                end)
                            end
                        end
                    elseif v.Name == "GoldPile" then
                        local prompt = v:WaitForChild("LootPrompt")
                        local interactions = prompt:GetAttribute("Interactions")
                            
                        if not interactions then
                            task.spawn(function()
                                repeat task.wait(0.1)
                                    if plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12 then
                                        fireproximityprompt(prompt) 
                                    end
                                until prompt:GetAttribute("Interactions") or not flags.draweraura
                            end)
                        end
                    elseif v.Name:sub(1,8) == "ChestBox" then
                        local prompt = v:WaitForChild("ActivateEventPrompt")
                        local interactions = prompt:GetAttribute("Interactions")
                        
                        if not interactions then
                            task.spawn(function()
                                repeat task.wait(0.1)
                                    if plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12 then
                                        fireproximityprompt(prompt)
                                    end
                                until prompt:GetAttribute("Interactions") or not flags.draweraura
                            end)
                        end
                    elseif v.Name == "RolltopContainer" then
                        local prompt = v:WaitForChild("ActivateEventPrompt")
                        local interactions = prompt:GetAttribute("Interactions")
                        
                        if not interactions then
                            task.spawn(function()
                                repeat task.wait(0.1)
                                    if plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12 then
                                        fireproximityprompt(prompt)
                                    end
                                until prompt:GetAttribute("Interactions") or not flags.draweraura
                            end)
                        end
                    end 
                end
            end
    
            local subaddcon
            subaddcon = room.DescendantAdded:Connect(function(v)
                check(v) 
            end)
            
            for i,v in pairs(room:GetDescendants()) do
                check(v)
            end
            
            task.spawn(function()
                repeat task.wait() until not flags.draweraura
                subaddcon:Disconnect() 
            end)
        end
        
        local addconnect
        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            setup(room)
        end)
        
        for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
            if room:FindFirstChild("Assets") then
                setup(room) 
            end
        end
        
        repeat task.wait() until not flags.draweraura
        addconnect:Disconnect()
    end
end)

local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

MainSection:Toggle("Event notifiers",false, function(val)
    flags.hintrush = val
    
    if val then
        local addconnect
        addconnect = workspace.ChildAdded:Connect(function(v)
            if table.find(entitynames,v.Name) then
                repeat task.wait() until plr:DistanceFromCharacter(v:GetPivot().Position) < 1000 or not v:IsDescendantOf(workspace)
                
                if v:IsDescendantOf(workspace) then
            Notification:Notify(
    {Title = "KING HUB Notification [Beta]", Description = v.Name:gsub("Moving",""):lower().." Spawned Hide!"},
    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"},
    {Image = "http://www.roblox.com/asset/?id=11677001091", ImageColor = Color3.fromRGB(255, 255, 255)}
)
                end
            end
        end) 
        
        repeat task.wait() until not flags.hintrush
        addconnect:Disconnect()
    end
end)

MainSection:Toggle("Old Seek",false, function(Sekold)
if Sekold then

_G.EZLODES = true

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.EZLODES then
local Tuking = true
local TOOL = 1
local TOOLKing = 0

game:GetService("Workspace").SeekMoving.Figure.Transparency = TOOLKing
game:GetService("Workspace").SeekMoving.Figure.ParticleEmitter.Enabled = Tuking
game:GetService("Workspace").SeekMoving.Figure.Attachment.ParticleEmitter.Enabled = Tuking
game:GetService("Workspace").SeekMoving.SeekRig.UpperTorso.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftLowerArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightLowerLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightUpperArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightUpperLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightLowerArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftUpperLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LowerTorso.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Black.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Eye.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Eye.Decal.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftLowerLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftUpperArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.SeekPuddle.Transparency = TOOL
        end
    end)
end)
        else

_G.EZLODES = false

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.EZLODES then
local Tuking = true
local TOOL = 1
local TOOLKing = 0

game:GetService("Workspace").SeekMoving.Figure.Transparency = TOOLKing
game:GetService("Workspace").SeekMoving.Figure.ParticleEmitter.Enabled = Tuking
game:GetService("Workspace").SeekMoving.Figure.Attachment.ParticleEmitter.Enabled = Tuking
game:GetService("Workspace").SeekMoving.SeekRig.UpperTorso.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftLowerArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightLowerLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightUpperArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightUpperLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightLowerArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftUpperLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LowerTorso.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Black.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Eye.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Eye.Decal.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftLowerLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftUpperArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.SeekPuddle.Transparency = TOOL
        end
    end)
end)

wait()


local Tuking = false
local TOOL = 0
local TOOLKing = 1

game:GetService("Workspace").SeekMoving.Figure.Transparency = TOOLKing
game:GetService("Workspace").SeekMoving.Figure.ParticleEmitter.Enabled = Tuking
game:GetService("Workspace").SeekMoving.Figure.Attachment.ParticleEmitter.Enabled = Tuking
game:GetService("Workspace").SeekMoving.SeekRig.UpperTorso.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftLowerArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightLowerLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightUpperArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightUpperLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.RightLowerArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftUpperLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LowerTorso.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Black.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Eye.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.Head.Eye.Decal.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftLowerLeg.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.LeftUpperArm.Transparency = TOOL
game:GetService("Workspace").SeekMoving.SeekRig.SeekPuddle.Transparency = TOOL

end
end)

local a90remote = game.ReplicatedStorage:WaitForChild("EntityInfo"):WaitForChild("A90")

MainSection:Toggle("Bypass A-90 [The Rooms]",false, function(val)
        flags.noa90 = val
        
        if val  then
            local jumpscare = plr.PlayerGui:WaitForChild("MainUI"):WaitForChild("Jumpscare"):FindFirstChild("Jumpscare_A90")
           
            if jumpscare then
                jumpscare.Parent = nil
                
                a90remote.Parent = nil
                repeat task.wait()
                    game.SoundService.Main.Volume = 1 
                until not flags.noa90
                jumpscare.Parent = plr.PlayerGui.MainUI.Jumpscare
                a90remote.Parent = entityinfo 
            end
        end
end)

local ESP = win:Tab("ESP")

ESP:Toggle("Doors",false, function(val)
    flags.espdoors = val
    
    if val then
        local function setup(room)
            local door = room:WaitForChild("Door"):WaitForChild("Door")
            
            task.wait(0.1)
            local h = esp(door,Color3.fromRGB(90,255,40),door,"Door")
            table.insert(esptable.doors,h)
            
            door:WaitForChild("Open").Played:Connect(function()
                h.delete()
            end)
            
            door.AncestryChanged:Connect(function()
                h.delete()
            end)
        end
        
        local addconnect
        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            setup(room)
        end)
        
        for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
            if room:FindFirstChild("Assets") then
                setup(room) 
            end
        end
        
        repeat task.wait() until not flags.espdoors
        addconnect:Disconnect()
        
        for i,v in pairs(esptable.doors) do
            v.delete()
        end 
    end
end)
ESP:Toggle("Keys And Levers",false, function(val)
    flags.espkeys = val
    
    if val then
        local function check(v)
            if v:IsA("Model") and (v.Name == "LeverForGate" or v.Name == "KeyObtain") then
                task.wait(0.1)
                if v.Name == "KeyObtain" then
                    local hitbox = v:WaitForChild("Hitbox")
                    local parts = hitbox:GetChildren()
                    table.remove(parts,table.find(parts,hitbox:WaitForChild("PromptHitbox")))
                    
                    local h = esp(parts,Color3.fromRGB(255,255,255),hitbox,"Key")
                    table.insert(esptable.keys,h)
                    
                elseif v.Name == "LeverForGate" then
                    local h = esp(v,Color3.fromRGB(255,255,255),v.PrimaryPart,"Lever")
                    table.insert(esptable.keys,h)
                    
                    v.PrimaryPart:WaitForChild("SoundToPlay").Played:Connect(function()
                        h.delete()
                    end) 
                end
            end
        end
        
        local function setup(room)
            local assets = room:WaitForChild("Assets")
            
            assets.DescendantAdded:Connect(function(v)
                check(v) 
            end)
                
            for i,v in pairs(assets:GetDescendants()) do
                check(v)
            end 
        end
        
        local addconnect
        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            setup(room)
        end)
        
        for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
            if room:FindFirstChild("Assets") then
                setup(room) 
            end
        end
        
        repeat task.wait() until not flags.espkeys
        addconnect:Disconnect()
        
        for i,v in pairs(esptable.keys) do
            v.delete()
        end 
    end
end)
ESP:Toggle("Item",false, function(val)
     flags.espitems = val
    
    if val then
        local function check(v)
            if v:IsA("Model") and (v:GetAttribute("Pickup") or v:GetAttribute("PropType")) then
                task.wait(0.1)
                
                local part = (v:FindFirstChild("Handle") or v:FindFirstChild("Prop"))
                local h = esp(part,Color3.fromRGB(255,255,255),part,v.Name)
                table.insert(esptable.items,h)
            end
        end
        
        local function setup(room)
            local assets = room:WaitForChild("Assets")
            
            if assets then  
                local subaddcon
                subaddcon = assets.DescendantAdded:Connect(function(v)
                    check(v) 
                end)
                
                for i,v in pairs(assets:GetDescendants()) do
                    check(v)
                end
                
                task.spawn(function()
                    repeat task.wait() until not flags.espitems
                    subaddcon:Disconnect()  
                end) 
            end 
        end
        
        local addconnect
        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            setup(room)
        end)
        
        for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
            if room:FindFirstChild("Assets") then
                setup(room) 
            end
        end
        
        repeat task.wait() until not flags.espitems
        addconnect:Disconnect()
        
        for i,v in pairs(esptable.items) do
            v.delete()
        end 
    end
end)
ESP:Toggle("Books",false, function(val)
    flags.espbooks = val
    
    if val then
        local function check(v)
            if v:IsA("Model") and (v.Name == "LiveHintBook" or v.Name == "LiveBreakerPolePickup") then
                task.wait(0.1)
                
                local h = esp(v,Color3.fromRGB(255,255,255),v.PrimaryPart,"Book")
                table.insert(esptable.books,h)
                
                v.AncestryChanged:Connect(function()
                    if not v:IsDescendantOf(room) then
                        h.delete() 
                    end
                end)
            end
        end
        
        local function setup(room)
            if room.Name == "50" or room.Name == "100" then
                room.DescendantAdded:Connect(function(v)
                    check(v) 
                end)
                
                for i,v in pairs(room:GetDescendants()) do
                    check(v)
                end
            end
        end
        
        local addconnect
        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            setup(room)
        end)
        
        for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
            setup(room) 
        end
        
        repeat task.wait() until not flags.espbooks
        addconnect:Disconnect()
        
        for i,v in pairs(esptable.books) do
            v.delete()
        end 
    end
end)

local entitynames = {"RushMoving","AmbushMoving","Snare","A60","A120"}

ESP:Toggle("Entitys",false, function(val)
    flags.esprush = val
    
    if val then
        local addconnect
        addconnect = workspace.ChildAdded:Connect(function(v)
            if table.find(entitynames,v.Name) then
                task.wait(0.1)
                
                local h = esp(v,Color3.fromRGB(255,25,25),v.PrimaryPart,v.Name:gsub("Moving",""))
                table.insert(esptable.entity,h)
            end
        end)
        
        local function setup(room)
            if room.Name == "50" or room.Name == "100" then
                local figuresetup = room:WaitForChild("FigureSetup")
            
                if figuresetup then
                    local fig = figuresetup:WaitForChild("FigureRagdoll")
                    task.wait(0.1)
                    
                    local h = esp(fig,Color3.fromRGB(255,25,25),fig.PrimaryPart,"Figure")
                    table.insert(esptable.entity,h)
                end 
            else
                local assets = room:WaitForChild("Assets")
                
                local function check(v)
                    if v:IsA("Model") and table.find(entitynames,v.Name) then
                        task.wait(0.1)
                        
                        local h = esp(v:WaitForChild("Base"),Color3.fromRGB(255,25,25),v.Base,"Snare")
                        table.insert(esptable.entity,h)
                    end
                end
                
                assets.DescendantAdded:Connect(function(v)
                    check(v) 
                end)
                
                for i,v in pairs(assets:GetDescendants()) do
                    check(v)
                end
            end 
        end
        
        local roomconnect
        roomconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            setup(room)
        end)
        
        for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
            setup(room) 
        end
        
        repeat task.wait() until not flags.esprush
        addconnect:Disconnect()
        roomconnect:Disconnect()
        
        for i,v in pairs(esptable.entity) do
            v.delete()
        end 
    end
end)
ESP:Toggle("locker And Closet",false, function(val)
    flags.esplocker = val
    
    if val then
        local function check(v)
            if v:IsA("Model") then
                task.wait(0.1)
                if v.Name == "Wardrobe" then
                    local h = esp(v.PrimaryPart,Color3.fromRGB(90,255,40),v.PrimaryPart,"Closet")
                    table.insert(esptable.lockers,h) 
                elseif (v.Name == "Rooms_Locker" or v.Name == "Rooms_Locker_Fridge") then
                    local h = esp(v.PrimaryPart,Color3.fromRGB(90,255,40),v.PrimaryPart,"Locker")
                    table.insert(esptable.lockers,h) 
                end
            end
        end
        
        local function setup(room)
            local assets = room:WaitForChild("Assets")
            
            if assets then
                local subaddcon
                subaddcon = assets.DescendantAdded:Connect(function(v)
                    check(v) 
                end)
                
                for i,v in pairs(assets:GetDescendants()) do
                    check(v)
                end
                
                task.spawn(function()
                    repeat task.wait() until not flags.esplocker
                    subaddcon:Disconnect()  
                end) 
            end 
        end
        
        local addconnect
        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            setup(room)
        end)
        
        for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
            setup(room) 
        end
        
        repeat task.wait() until not flags.esplocker
        addconnect:Disconnect()
        
        for i,v in pairs(esptable.lockers) do
            v.delete()
        end 
    end
end)


function isnil(thing)
    return (thing == nil)
end
local function round(n)
    return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
    for i,v in pairs(game:GetService'Players':GetChildren()) do
        pcall(function()
            if not isnil(v.Character) then
                if ESPPlayer then
                    if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui',v.Character.Head)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v.Character.Head
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "SourceSansBold"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        if v.Team == game.Players.LocalPlayer.Team then
                            name.TextColor3 = Color3.new(102, 255, 153)
                        else
                            name.TextColor3 = Color3.new(102, 255, 153)
                        end
                    else
                        v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
                    end
                else
                    if v.Character.Head:FindFirstChild('NameEsp'..Number) then
                        v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
                    end
                end
            end
        end)
    end
end

ESP:Toggle("Players [Name]",false, function(PLAYER)
    ESPPlayer = PLAYER
    while ESPPlayer do wait()
        UpdatePlayerChams()
    end
end)

ESP:Toggle("Players",false, function(ESPPLAYER)
getgenv().enabled = ESPPLAYER --Toggle on/off
getgenv().filluseteamcolor = false --Toggle fill color using player team color on/off
getgenv().outlineuseteamcolor = false --Toggle outline color using player team color on/off
getgenv().fillcolor = Color3.new(0, 0, 0) --Change fill color, no need to edit if using team color
getgenv().outlinecolor = Color3.new(1, 1, 1) --Change outline color, no need to edit if using team color
getgenv().filltrans = 0 --Change fill transparency
getgenv().outlinetrans = 0 --Change outline transparency

loadstring(game:HttpGet("https://raw.githubusercontent.com/zntly/highlight-esp/main/esp.lua"))()
end)
end)
L.Name = "L"
L.Parent = Frame
L.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
L.Position = UDim2.new(0, 0, -0.389999986, 0)
L.Size = UDim2.new(0, 484, 0, 38)
L.Font = Enum.Font.SourceSans
L.Text = "Language [ภาษา]"
L.TextColor3 = Color3.fromRGB(0, 0, 0)
L.TextSize = 37.000

Or.Name = "Or"
Or.Parent = Frame
Or.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Or.Position = UDim2.new(0.285123974, 0, -0.00999999978, 0)
Or.Size = UDim2.new(0, 187, 0, 101)
Or.Font = Enum.Font.SourceSans
Or.Text = "Or [หรือ]"
Or.TextColor3 = Color3.fromRGB(0, 255, 85)
Or.TextSize = 64.000