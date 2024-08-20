	local Players = game:GetService("Players")
	local MarketplaceService = game:GetService("MarketplaceService")
	local ServerStorage = game:GetService("ServerStorage")

	-- Gamepass ID'leri ve karşılık gelen araçlar
	local GamepassToTool = {
		[897056859] = "Cloud", -- Gamepass ID: Tool Name
		[896587586] = "FlyingCarpet",
		-- Diğer Gamepass ID'leri ve araç isimleri
	}

	-- Oyuncuya aracı ekleyen fonksiyon
	local function giveToolToPlayer(player, toolName)
		-- Araç ServerStorage'dan bulunur
		local tool = ServerStorage:FindFirstChild(toolName)
		if tool then
			-- Araç oyuncunun Backpack'ine eklenir
			if not player.Backpack:FindFirstChild(toolName) then
				local clonedTool = tool:Clone()
				clonedTool.Parent = player.Backpack
				print("Added tool " .. toolName .. " to player " .. player.Name)
			end
		else
			warn("Tool " .. toolName .. " not found in ServerStorage.")
		end
	end

	-- Gamepass satın alımı tamamlandığında çağrılan fonksiyon
	local function onGamePassPurchased(player, gamePassId)
		local toolName = GamepassToTool[gamePassId]
		if toolName then
			giveToolToPlayer(player, toolName)
		else
			warn("No tool associated with gamepass ID " .. gamePassId)
		end
	end

	-- Oyuncu oyuna katıldığında araçları kontrol etme ve ekleme
	Players.PlayerAdded:Connect(function(player)
		player.CharacterAdded:Connect(function(character)
			-- Gamepass'leri kontrol etme ve araçları ekleme
			for gamePassId, toolName in pairs(GamepassToTool) do
				if MarketplaceService:UserOwnsGamePassAsync(player.UserId, gamePassId) then
					giveToolToPlayer(player, toolName)
				end
			end
		end)
	end)

	-- Gamepass satın alımı tamamlandığında tetiklenen olay
	MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(player, gamePassId, purchased)
		if purchased then
			onGamePassPurchased(player, gamePassId)
		end
	end)
