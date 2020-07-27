--make sure to change 'NameOne' and 'NameTwo' with you different leaderstats names

local players = game:GetService("Players")
local datastore = game:GetService("DataStoreService")
local ds1 = datastore:GetDataStore("CashValueSaver")
local ds2 = datastore:GetDataStore("RebirthsValueSaver")

players.PlayerAdded:connect(function(player)
	local folder = Instance.new("Folder")
	folder.Name = "leaderstats"
	folder.Parent = player
	
	local currency1 = Instance.new("IntValue")
	currency1.Name = "NameOne"
	currency1.Parent = player.leaderstats
	currency1.Value = ds1:GetAsync(player.UserId) or 0
	ds1:SetAsync(player.UserId, currency1.Value)
	local currency2 = Instance.new("IntValue")
	
	currency2.Name = "NameTwo"
	currency2.Parent = player.leaderstats
	currency2.Value = ds2:GetAsync(player.UserId) or 0
	ds2:SetAsync(player.UserId, currency2.Value)
	
	while true do
		wait(1)
		ds1:SetAsync(player.UserId, currency1.Value)
		ds2:SetAsync(player.UserId, currency2.Value)
	end
	game.Players.PlayerRemoving:Connect(function()
		ds1:SetAsync(player.UserId, currency1.Value)
		ds2:SetAsync(player.UserId, currency2.Value)
	end)
end)
