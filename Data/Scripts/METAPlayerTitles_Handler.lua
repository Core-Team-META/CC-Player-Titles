--[[
	Player Titles - Handler (server context)

	Contributors:
		Chipnertkj [https://www.coregames.com/user/aabffd57e2814ff1bc7f80f5fd32b5a4]
		Nicholas Foreman [https://www.coregames.com/user/f9df3457225741c89209f6d484d0eba8]

	Handles server-side data and replication for Player Titles.
]]

------------------------------------------------------------------------------------------------------------------------
--	CoreObject References
------------------------------------------------------------------------------------------------------------------------
local rootFolder = script:GetCustomProperty("RootFolder"):WaitForObject()
local playerDataFolder = script:GetCustomProperty("PlayerDataFolder"):WaitForObject()
local titleDataFolder = script:GetCustomProperty("TitleDataFolder"):WaitForObject()
------------------------------------------------------------------------------------------------------------------------
--	Config
------------------------------------------------------------------------------------------------------------------------
if _G.METAPlayerTitles == nil then
	_G.METAPlayerTitles = {configurator = assert(rootFolder:GetCustomProperty("Configurator"):GetObject(), "Configurator not found.")}
end
local Config = require(script:GetCustomProperty("ConfiguratorReader"))
------------------------------------------------------------------------------------------------------------------------
--	Script Data
------------------------------------------------------------------------------------------------------------------------
local playerDataInstances = {}
local titleDataInstances = {}
local shouldUpdatePlayerIconData = false
local iconList = {}
------------------------------------------------------------------------------------------------------------------------
--	Functions
------------------------------------------------------------------------------------------------------------------------
local function RetrievePlayerDataObject(player)
	if player == nil then return end
	if player.id == nil then return end
	if playerDataInstances[player.id] then return playerDataInstances[player.id] end
	-- spawn
	local data = World.SpawnAsset(Config.handler.playerSessionDataTemplate, {parent = playerDataFolder})
	data.name = tostring(player.id)
	-- return
	playerDataInstances[player.id] = data
	return playerDataInstances[player.id]
end

local function DestroyPlayerDataObject(player)
	if player == nil then return end
	if player.id == nil then return end
	if not playerDataInstances[player.id] then return end
	-- destroy
	playerDataInstances[player.id]:Destroy()
	playerDataInstances[player.id] = nil
end

local function Initialize()
	local players = Game.GetPlayers()
	for i = 1, #players do
		local player = players[i]
		iconList[player.id] = {}
		RetrievePlayerDataObject(player)
	end
end

local function OnPlayerJoined(player)
	iconList[player.id] = {}
	RetrievePlayerDataObject(player)
end

local function OnPlayerLeft(player)
	iconList[player.id] = nil
	DestroyPlayerDataObject(player)
end

function Config.SetOverrideTitle(player, title)
	if player == nil then return end
	if player.id == nil then return end
	-- set title
	local data = RetrievePlayerDataObject(player)
	data:SetNetworkedCustomProperty("OverrideTitle", title or "")
end

function Config.AddPlayerIcon(player, iconID, duration)
	-- generate unique id
	local iconUID
	repeat
		iconUID = math.random()
	until iconList[player.id][iconUID] == nil
	-- add to list and return iconUID
	iconList[player.id][iconUID] = {iconID = iconID, duration = tonumber(duration)}
	shouldUpdatePlayerIconData = true
	return iconUID
end

function Config.RemovePlayerIcon(player, iconUID)
	if not iconUID then return nil end
	-- add to list and return id
	local r = iconList[player.id][iconUID]
	iconList[player.id][iconUID] = nil
	shouldUpdatePlayerIconData = true
	return r
end

local function UpdatePlayerIconData(player)
	-- data
	local data = RetrievePlayerDataObject(player):GetCustomProperty("Icons")
	-- prepare final list
	local list = {}
	i = 0
	for uid, v in pairs(iconList[player.id]) do
		i = i + 1
		if i > Config.handler.iconCount+1 then break end
		list[i] = v.iconID or ""
	end
	if #list > Config.handler.iconCount then
		list[Config.handler.iconCount] = Config.handler.iconEllipsisID
	end
	-- prepare final string
	local finalString = ""
	for i = 1, Config.handler.iconCount do
		finalString = finalString .. tostring(list[i] or "") .. ":"
	end
	finalString = string.sub(finalString, 1, string.len(finalString)-1)
	RetrievePlayerDataObject(player):SetNetworkedCustomProperty("Icons", finalString)
	shouldUpdatePlayerIconData = false
end

------------------------------------------------------------------------------------------------------------------------
--	Tick
------------------------------------------------------------------------------------------------------------------------
function Tick(dt)
	-- update duration
	for pid, _ in pairs(iconList) do
		for uid, v in pairs(iconList[pid]) do
			if v.duration then
				if v.duration > 0 then
					v.duration = v.duration - dt
				end -- no else here on purpose
				if v.duration <= 0 then
					local player = Config.GetPlayerById(pid)
					if player:IsValid() then
						Config.RemovePlayerIcon(player, uid)
					end
				end
			end
		end
	end
	-- update icon data on delta
	if shouldUpdatePlayerIconData then
		local players = Game.GetPlayers()
		for i = 1, #players do
			UpdatePlayerIconData(players[i])
		end
	end
end
------------------------------------------------------------------------------------------------------------------------
--	Initialization
------------------------------------------------------------------------------------------------------------------------
Game.playerJoinedEvent:Connect(OnPlayerJoined)
Game.playerLeftEvent:Connect(OnPlayerLeft)
Initialize()