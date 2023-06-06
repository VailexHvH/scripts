local function randomizeLetters(length)
    local letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local randomString = ""

    math.randomseed(os.time())

    for i = 1, length do
        local randomIndex = math.random(1, #letters)
        local randomLetter = letters:sub(randomIndex, randomIndex)
        randomString = randomString .. randomLetter
    end

    return randomString
end

local ChatService = require(game:GetService("ServerScriptService"):WaitForChild("ChatServiceRunner"):WaitForChild("ChatService"))

if not ChatService:GetChannel("All") then
	while true do
		local ChannelName = ChatService.ChannelAdded:Wait()
		if ChannelName == "All" then
			break
		end
	end
end

_G.Running = true
_G.SpamText = "ggs"
_G.SpamTime = 1

while _G.Running == true then
    local yeahyeah = ChatService:AddSpeaker(randomizeLetters(20))
    yeahyeah:JoinChannel("All")
    yeahyeah:SetExtraData("NameColor", Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)))
    yeahyeah:SayMessage(_G.SpamText, "All")
    wait(_G.SpamTime)
end