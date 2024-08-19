local button =script.Parent
local SocialService = game:GetService("SocialService")
local player = game.Players.LocalPlayer

function onButoonPressed()
	local success, result = pcall(
		function()
			return SocialService:CanSendGameInviteAsync(player)
		end
	)

	if result == true then
		SocialService:PromptGameInvite(player)
	end
end

button.MouseButton1Click:Connect(onButoonPressed)
button.TouchTap:Connect(onButoonPressed)

