local AvatarEditorService = game:GetService("AvatarEditorService")
local UNIVERSE_ID = 18995373473  -- Kendi Universe ID'nizi buraya ekleyin
local TIME_INTERVAL = 60        -- PromtSetFavorite'in kaç saniye aralıkla açılacağını belirleyin

local function showFavoritePrompt()
	AvatarEditorService:PromptSetFavorite(UNIVERSE_ID, Enum.AvatarItemType.Asset, true)
end

while true do
	wait(TIME_INTERVAL)  -- Belirtilen süre kadar bekle
	showFavoritePrompt() -- Favori öğe penceresini aç
end
