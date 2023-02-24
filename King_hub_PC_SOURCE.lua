local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/KINGHUB01/KING-HUB-NO-1/main/Ui", true))()

local PepsiUi = library:CreateWindow({
    Name = "KING HUB | DOORS",
    Theme = {
        Image = "rbxassetid://7483871523",
        Info = "Info",
        Background = {
            Asset = "rbxassetid://11677001091"
        }
    }
})
local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid")

if not fireproximityprompt then
    local msg = Instance.new("Message",workspace)
    msg.Text = 'Your executor does not have the "FireProximityPrompt" function, please get a better executor'
    task.wait(6)
    msg:Destroy()
    error("no fireproximityprompt function")
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

workspace.ChildAdded:Connect(function(v)
    task.wait()
    if v.Name == "RushMoving" or v.Name == "AmbushMoving" then
        while workspace:FindFirstChild(v.Name) and getgenv().hxde do
            task.wait()
            part = v:WaitForChild("RushNew")
            game.Players.LocalPlayer.Character.Collision.CFrame = CFrame.new(part.Position + Vector3.new(0,75,0))
        end
    end
end)
    
local Page = PepsiUi:CreateTab({
    Name = "Main"
})

local TestTab = Page:CreateSection({
    Name = "LocalPlayer", -- ชื่อ
    Side = "Left" -- ตำแหน่ง Left/Right
})

TestTab:AddSlider({
	Name = "Slider",
	Value = 5, -- ค่าที่ให้เลือก
	Min = 0, -- น้อยสุด
	Max = 5, -- มากสุด
	Format = "Speed : %s%%",
	Callback = function(abcBotts)
    SelectBoots = abcBotts
	end
})

TestTab:AddToggle({
    Name = "Speed Boots",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(SPEEDHACKER)
_G.BootsSpeed = SPEEDHACKER
    end
})

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.BootsSpeed then
            game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * SelectBoots/50)
        end
    end)
end)

TestTab:AddToggle({
    Name = "Noclip [10%]",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(noclip)
        getgenv().col = noclip
       for i,v in next, game.Players.LocalPlayer.Character:GetDescendants() do
          if v.IsA(v,"BasePart") and getgenv().col == false then
             v.CanCollide = true
          elseif v.IsA(v,"BasePart") and getgenv().col == true then
            v.CanCollide = false
          end
       end
    end
})

TestTab:AddSlider({
	Name = "Slider",
	Value = 70, -- ค่าที่ให้เลือก
	Min = 70, -- น้อยสุด
	Max = 120, -- มากสุด
	Format = "Field of View : %s%%",
	Callback = function(FieldOfViewse)
    FieldOfViewe = FieldOfViewse
	end
})

TestTab:AddToggle({
    Name = "Field of View",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(FieldOfViews)
_G.FieldOfView = FieldOfViews

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.FieldOfView then
game:GetService("Workspace").Camera.FieldOfView = FieldOfViewe
        end
    end)
end)
    end
})

local TestTab = Page:CreateSection({
    Name = "Fe", -- ชื่อ
    Side = "Left" -- ตำแหน่ง Left/Right
})

TestTab:AddButton({
    Name = "Korblox",
    Callback = function()
	local ply = game.Players.LocalPlayer
	local chr = ply.Character
	chr.RightLowerLeg.MeshId = "902942093"
	chr.RightLowerLeg.Transparency = "1"
	chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
	chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
	chr.RightFoot.MeshId = "902942089"
	chr.RightFoot.Transparency = "1"
    end
})
TestTab:AddButton({
    Name = "Headless",
    Callback = function()
	game.Players.LocalPlayer.Character.Head.Transparency = 1
	game.Players.LocalPlayer.Character.Head.Transparency = 1
	for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
		if (v:IsA("Decal")) then
			v.Transparency = 1
		end
	end
    end
})
TestTab:AddToggle({
    Name = "Effect",
    Callback = function(Effectsew)
        if Effectsew then
game:GetService("ReplicatedStorage")["hlelo exploiter enjoy this particle"].Enabled = true
local Agility = game:GetService("ReplicatedStorage")["hlelo exploiter enjoy this particle"]:Clone()
Agility.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        else
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart["hlelo exploiter enjoy this particle"]:Destroy()
        end
    end
})


local TestTab = Page:CreateSection({
    Name = "Main", -- ชื่อ
    Side = "Right" -- ตำแหน่ง Left/Right
})

TestTab:AddToggle({
    Name = "FullBright",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(v)
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
    end
})

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

TestTab:AddToggle({
    Name = "Remove Seek Arms/Fire",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(SeekESs)
_G.SeekES = SeekESs
    end
})

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.Gates then
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Gate"):Destroy()
        end
    end)
end)

TestTab:AddToggle({
    Name = "Remove Gate Doors",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(Gatess)
_G.Gates = Gatess
    end
})

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.PuzzleD then
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets").Paintings:Destroy()
        end
    end)
end)

TestTab:AddToggle({
    Name = "Remove Puzzle Doors",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(PuzzleDs)
_G.PuzzleD = PuzzleDs
    end
})

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.SkeletonD then
game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Wax_Door"):Destroy()
        end
    end)
end)

TestTab:AddToggle({
    Name = "Remove Skeleton Door",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(SkeletonDs)
_G.SkeletonD = SkeletonDs
    end
})



TestTab:AddToggle({
    Name = "Fast E",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(noEwait)
        getgenv().noEwaits = noEwait
        PromptButtonHoldBegan = game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
            if getgenv().noEwaits then
			fireproximityprompt(prompt)
            end
		end)
    end
})

game:GetService("Workspace").CurrentRooms.DescendantAdded:Connect(function(v)
    if not getgenv().midd then return end
    if v.IsA(v,"ProximityPrompt") then
       if getgenv().midd then
        v.MaxActivationDistance = 20
       end
    end
end)


TestTab:AddToggle({
    Name = "Press E Far",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(MALE)
getgenv().midd = MALE
    end
})

TestTab:AddToggle({
    Name = "Win Heartbeat",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(Heartbeat)
   getgenv().winhb = Heartbeat
    end
})

TestTab:AddToggle({
    Name = "Screech No Damage",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(noobfly)
        getgenv().avoidsc = noobfly
    end
})
TestTab:AddToggle({
    Name = "Old Seek",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(Sekold)
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
    end
})
TestTab:AddToggle({
    Name = "Invisible Doors",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(AGE)
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
    end
})
TestTab:AddToggle({
    Name = "Auto Loot Containers",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(val)
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
    end
})

local a90remote = game.ReplicatedStorage:WaitForChild("EntityInfo"):WaitForChild("A90")

TestTab:AddToggle({
    Name = "Bypass A-90 [The Rooms]",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(val)
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
    end
})

local Page = PepsiUi:CreateTab({
    Name = "Visuals"
})

local TestTab = Page:CreateSection({
    Name = "ESP", -- ชื่อ
    Side = "Left" -- ตำแหน่ง Left/Right
})

TestTab:AddToggle({
    Name = "Doors",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(val)
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
    end
})
TestTab:AddToggle({
    Name = "Keys And Levers",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(val)
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
    end
})
TestTab:AddToggle({
    Name = "Items",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(val)
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
    end
})
TestTab:AddToggle({
    Name = "Books",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(val)
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
    end
})

local entitynames = {"RushMoving","AmbushMoving","Snare","A60","A120"}

TestTab:AddToggle({
    Name = "Entitys",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(val)
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
    end
})
TestTab:AddToggle({
    Name = "locker And Closet",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(val)
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
    end
})


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

TestTab:AddToggle({
    Name = "Players [Name]",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(PLAYER)
    ESPPlayer = PLAYER
    while ESPPlayer do wait()
        UpdatePlayerChams()
    end
    end
})
TestTab:AddToggle({
    Name = "Players",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(ESPPLAYER)
getgenv().enabled = ESPPLAYER --Toggle on/off
getgenv().filluseteamcolor = false --Toggle fill color using player team color on/off
getgenv().outlineuseteamcolor = false --Toggle outline color using player team color on/off
getgenv().fillcolor = Color3.new(0, 0, 0) --Change fill color, no need to edit if using team color
getgenv().outlinecolor = Color3.new(1, 1, 1) --Change outline color, no need to edit if using team color
getgenv().filltrans = 0 --Change fill transparency
getgenv().outlinetrans = 0 --Change outline transparency

loadstring(game:HttpGet("https://raw.githubusercontent.com/zntly/highlight-esp/main/esp.lua"))()
    end
})

local TestTab = Page:CreateSection({
    Name = "View Entities", -- ชื่อ
    Side = "Right" -- ตำแหน่ง Left/Right
})

local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

TestTab:AddToggle({
    Name = "Event notifiers",
	Value = _G.ConfigToggle, -- ปรับค่าToggle true/false or Config
    Callback = function(val)
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
    end
})

local RushSpawn = TestTab:AddLabel({
    Name = "? : [IDK]"
})
    spawn(function()
       game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
if not game.workspace:FindFirstChild("RushMoving") then
    RushSpawn:Set("🔴 : Rush No Spawn")
elseif game.workspace:FindFirstChild("RushMoving") then
    RushSpawn:Set("🟢 : Rush Spawn Hide!")
end
        end)
       end)
    end)
local AmbushMovingSpawn = TestTab:AddLabel({
    Name = "? : [IDK]"
})
    spawn(function()
       game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
if not game.workspace:FindFirstChild("AmbushMoving") then
    AmbushMovingSpawn:Set("🔴 : Ambush No Spawn")
elseif game.workspace:FindFirstChild("AmbushMoving") then
    AmbushMovingSpawn:Set("🟢 : Ambush Spawn Hide!")
end
        end)
       end)
    end)
local SeekMovingSpawn = TestTab:AddLabel({
    Name = "? : [IDK]"
})
    spawn(function()
       game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
if not game.workspace:FindFirstChild("SeekMoving") then
    SeekMovingSpawn:Set("🔴 : Seek No Spawn")
elseif game.workspace:FindFirstChild("SeekMoving") then
    SeekMovingSpawn:Set("🟢 : Good Luck Meet Seek!")
end
        end)
       end)
    end)