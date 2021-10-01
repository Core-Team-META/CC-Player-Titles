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
local playerSessionDataInstances = {} -- all PlayerSessionData CoreObjects
local titleSessionDataInstances = {} -- all TitleSessionData CoreObjects
local shouldUpdatePlayerIconData = false -- icon data delta, used to replicate icon data on changes
local iconList = {} -- icon table for each player
------------------------------------------------------------------------------------------------------------------------
--	Functions
------------------------------------------------------------------------------------------------------------------------
--	CoreObject<PlayerSessionData>|nil RetrievePlayerSessionData(Player)
--	Creates and or returns the session data for the specified player. Used to access the data.
local function RetrievePlayerSessionData(player)
	-- check if the player is valid
	if not Player.IsA(player, "Player") then return end
	if not player:IsValid() then return end
	if playerSessionDataInstances[player.id] then return playerSessionDataInstances[player.id] end
	-- spawn
	local data = World.SpawnAsset(Config.handler.playerSessionDataTemplate, {parent = playerDataFolder})
	data.name = tostring(player.id)
	-- return
	playerSessionDataInstances[player.id] = data
	return playerSessionDataInstances[player.id]
end

--	nil DestroyPlayerSessionData(Player)
--	Destroys the PlayerSessionData object of the specified player from hierarchy.
--	Used for unloading on player exit.
local function DestroyPlayerSessionData(player)
	-- check if the player is valid
	if not Player.IsA(player, "Player") then return end
	if not player:IsValid() then return end
	if not playerSessionDataInstances[player.id] then return end
	-- destroy
	playerSessionDataInstances[player.id]:Destroy()
	playerSessionDataInstances[player.id] = nil
end

--	nil Initialize()
--	Prepares the script. Loads in data objects and prepares a table with icons for each player.
local function Initialize()
	local players = Game.GetPlayers()
	for i = 1, #players do
		local player = players[i]
		iconList[player.id] = {}
		RetrievePlayerSessionData(player)
	end
end

--	nil SetOverrideTitle(Player, string<TitleID>)
--	Sets a player's override title to the title behind the supplied TitleID. The title will be reset if the title parameter is nil.
function Config.SetOverrideTitle(player, title)
	-- check if the player is valid
	if not Player.IsA(player, "Player") then return end
	if not player:IsValid() then return end
	-- set title
	local data = RetrievePlayerSessionData(player)
	data:SetNetworkedCustomProperty("OverrideTitle", title or "")
end

--	nil ModifyOverrideTitle(CoreObject<TitleSessionData>, string, any)
--	Modifies the supplied TitleSessionData. The changes should be applied before assigning the title to players.
--	The available parameters can be seen in the TitleSessionData template. They should 100% match with the ConfiguratorTitle template's properties.
--	The type of the last parameter changes depending on the property its supposed to overwrite. TitleColor should be set to a Color etc.
function Config.ModifyOverrideTitle(titleSessionDataInstance, property, value)
	if not titleSessionDataInstance then return end
	if not CoreObject.IsA(titleSessionDataInstance, "CoreObject") then return end
	if not titleSessionDataInstance:IsValid() then return end
	-- modify
	titleSessionDataInstance:SetNetworkedCustomProperty(property, value)
end

--	table GetOverrideTitles()
--	Returns the titleSessionDataInstances handler table, which holds all TitleSessionData instances spawned.
function Config.GetOverrideTitles()
	return titleSessionDataInstances
end

--	CoreObject<TitleSessionData> CreateOverrideTitle(string<TitleID>)
--	Creates and returns an Override Title. This function returns the TitleSessionData instance, not compiled TitleData.
--	Its compiled TitleData can be accessed using Config.GetTitleData.
--	The TitleSessionData can be modified using Config.ModifyOverrideTitle.
-- 	The TitleID has to be either a TitleID not used by any existing Override Titles, or one of the Static Titles' TitleIDs.
--	Do not confuse Create with Retrieve in function names. Create functions may produce errors when trying to create duplicates, while
--	Retrieve functions always return the value of the existing entry under the supplied id (if there's none, one will be created), in this case TitleID.
function Config.CreateOverrideTitle(title)
	if titleDataFolder:FindChildByName(title) then error("Override Title with the name \"" .. tostring(title) .. "\" already exists!") end
	-- spawn
	titleSessionDataInstance = World.SpawnAsset(Config.handler.titleSessionDataTemplate, {parent = titleDataFolder})
	titleSessionDataInstance.name = title
	-- return
	titleSessionDataInstances[#titleSessionDataInstances] = titleSessionDataInstance
	return titleSessionDataInstance
end

--	string<IconUID>|nil RemovePlayerIcon(Player, string<IconID>, number)
--	Creates an icon for the specified player and returns its UID.
function Config.AddPlayerIcon(player, iconID, duration)
	-- check if the player is valid
	if not Player.IsA(player, "Player") then return end
	if not player:IsValid() then return end
	-- generate unique id
	local iconUID
	repeat
		iconUID = tostring(math.random()) .. tostring(math.random())
	until iconList[player.id][iconUID] == nil
	-- add to list and return iconUID
	iconList[player.id][iconUID] = {iconID = iconID, duration = tonumber(duration)}
	shouldUpdatePlayerIconData = true
	return iconUID
end

--	table<IconData>|nil RemovePlayerIcon(Player, string<IconUID>)
--	Removes and returns an icon from a player, given its UID.
function Config.RemovePlayerIcon(player, iconUID)
	-- check if the player is valid
	if not Player.IsA(player, "Player") then return end
	if not player:IsValid() then return end
	if not iconUID then return nil end
	-- add to list and return id
	local r = iconList[player.id][iconUID]
	iconList[player.id][iconUID] = nil
	shouldUpdatePlayerIconData = true
	return r
end

--	nil UpdatePlayerIconData(Player)
--	Compiles data from a player's iconList table entry into a string and replicates it using a networked custom property.
local function UpdatePlayerIconData(player)
	-- data
	local data = RetrievePlayerSessionData(player):GetCustomProperty("Icons")
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
	RetrievePlayerSessionData(player):SetNetworkedCustomProperty("Icons", finalString)
	shouldUpdatePlayerIconData = false
end

--	nil OnPlayerJoined(Player)
--	Internal function that loads in data for the specified player. Connected to the Game.playerJoinedEvent event.
local counter = 0
local function OnPlayerJoined(player)
	iconList[player.id] = {}
	RetrievePlayerSessionData(player)
	counter = counter + 1
	player:SetResource("ABC", counter)
end

--	nil OnPlayerLeft(Player)
--	Internal function that unloads in data for the specified player. Connected to the Game.playerLeftEvent event.
local function OnPlayerLeft(player)
	iconList[player.id] = nil
	DestroyPlayerSessionData(player)
end

------------------------------------------------------------------------------------------------------------------------
--	Tick
------------------------------------------------------------------------------------------------------------------------
-- Handles icon duration and icon data updating.
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
