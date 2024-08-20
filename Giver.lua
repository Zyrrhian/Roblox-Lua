--ServerStorage'de Tool olması gerekiyor.

-- greenalien268 :)
-- I suggest storing this script inside ServerScriptService or Workspace
-- Sorry about it not working earlier, V2

local Id = 896798070 -- Put the gamepass id here, it is found in the url and is the number part
local VipPlayers = {"", ""} -- Any person's name put here will get the gamepass for free
local ToolName = {"GravityCoil"} -- Put the name of your tool here that MUST be stored in ServerStorage

local function FindPlayer(Plr)
	for Num, Pler in pairs(VipPlayers) do
		if Pler == Plr then
			return true
		end
	end
end

game.Players.PlayerAdded:connect(function(Player)
    if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(Player.UserId, Id) or FindPlayer(Player.Name) then 
        Player.CharacterAdded:Connect(function(character)
			for Num, Tool in pairs(ToolName) do
				if game:GetService("ServerStorage"):FindFirstChild(Tool) then
					game:GetService("ServerStorage")[Tool]:Clone().Parent = Player.Backpack
				end
			end
		end)
		
		for Num, Tool in pairs(ToolName) do
			if Player.Backpack:FindFirstChild(Tool) == nil then
				if game:GetService("ServerStorage"):FindFirstChild(Tool) then
					game:GetService("ServerStorage")[Tool]:Clone().Parent = Player.Backpack
				end
			end
		end
	end
end)
