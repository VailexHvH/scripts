local properties = {
   Color = Color3.new(12, 255, 0);
   Font = Enum.Font.FredokaOne;
   TextSize = 16;
}
wait(1)
properties.Text = "Destroying Server..."
game.StarterGui:SetCore("ChatMakeSystemMessage", properties)
wait(1)
