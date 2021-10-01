--[[
	Player Titles - List Handler (client)

	Contributors:
		Chipnertkj [https://www.coregames.com/user/aabffd57e2814ff1bc7f80f5fd32b5a4]
		Nicholas Foreman [https://www.coregames.com/user/f9df3457225741c89209f6d484d0eba8]

	Handles the player list UI for every client.
]]

------------------------------------------------------------------------------------------------------------------------
--	CoreObject References
------------------------------------------------------------------------------------------------------------------------
local rootFolder = script:GetCustomProperty("RootFolder"):WaitForObject()
local easingTarget = script:GetCustomProperty("EasingTarget"):WaitForObject()
local entriesScroll = script:GetCustomProperty("Entries"):WaitForObject()
------------------------------------------------------------------------------------------------------------------------
--	Config
------------------------------------------------------------------------------------------------------------------------
if _G.METAPlayerTitles == nil then
	_G.METAPlayerTitles = {configurator = assert(rootFolder:GetCustomProperty("Configurator"):GetObject(), "Configurator not found.")}
end
local Config = require(script:GetCustomProperty("ConfiguratorReader"))
if Config.list == nil then error("Configurator doesn't include list configuration data.") end
------------------------------------------------------------------------------------------------------------------------
--	Script Data
------------------------------------------------------------------------------------------------------------------------
local localPlayer = Game.GetLocalPlayer() -- local player
local entries = {} -- table holding all of the spawned list entries
local entryCount = 0
local listVisibility = true
local listVisibilityDelta = 0
------------------------------------------------------------------------------------------------------------------------
--	Functions
------------------------------------------------------------------------------------------------------------------------
local RetrieveEntry -- forward declaration

--	nil ReorderEntries()
--	Reorders all entries. Called after removing/adding them to the list.
local function ReorderEntries()
	local i = 0
	for _, entry in pairs(entries) do
		entry.y = 34*i
		if entry.visibility ~= Visibility.FORCE_OFF then
			i = i + 1
		end
	end
end

--	Visibility GetEntryVisibility(Player, Player)
--	Returns entry visibility based on the players' team relation and config.
function GetEntryVisibility(player1, player2)
	if not Player.IsA(player1, "Player") then return end
	if not player1:IsValid() then return end
	if not Player.IsA(player2, "Player") then return end
	if not player2:IsValid() then return end
	-- data
	local relation = Config.GetTeamRelation(player1, player2)
	-- get
	if (relation == Config.TeamRelation.SELF) or (relation == Config.TeamRelation.SELF_NEUTRAL) then
		-- show on self?
		return Config.list.showSelf and Visibility.INHERIT or Visibility.FORCE_OFF
	elseif relation == Config.TeamRelation.NEUTRAL then
		-- show on neutral?
		return Config.list.showNeutral and Visibility.INHERIT or Visibility.FORCE_OFF
	elseif relation == Config.TeamRelation.FRIENDLY then
		-- show on friendly?
		return Config.list.showFriendly and Visibility.INHERIT or Visibility.FORCE_OFF
	elseif relation == Config.TeamRelation.ENEMY then
		-- show on enemy?
		return Config.list.showEnemy and Visibility.INHERIT or Visibility.FORCE_OFF
	end
end

--	nil UpdateHeaderName([table<TitleData>])
--	Updates the name of the header. The parameter is for internal use (to use cached title data, can be used to override).
local function UpdateHeaderName(titleData)
	-- no need to check for player validity
	-- references
	local name = script:GetCustomProperty("Name"):WaitForObject()
	-- data
	local mode = string.upper(Config.list.nameColorMode)
	-- update
	-- mode color
	if mode == "STATIC" then
		name:SetColor(Config.list.nameStaticColor)
	elseif mode == "TEAM" then
		name:SetColor(Config.GetPlayerTeamColor(localPlayer, localPlayer))
	elseif mode == "TITLE" then
		titleData = titleData or Config.GetPlayerTitle(localPlayer)
		name:SetColor(titleData.titleColor)
	end
	-- text
	name.text = localPlayer.name or ""
end

--	nil UpdateHeaderSidebar([table<TitleData>])
--	Updates the sidebar of the header. The parameter is for internal use (to use cached title data, can be used to override).
local function UpdateHeaderSidebar(titledata)
	-- no need to check for player validity
	-- references
	local sidebar = script:GetCustomProperty("Sidebar"):WaitForObject()
	-- data
	local mode = string.upper(Config.list.sidebarColorMode)
	-- update
	-- mode color
	if mode == "STATIC" then
		sidebar:SetColor(Config.list.sidebarStaticColor)
	elseif mode == "TEAM" then
		sidebar:SetColor(Config.GetPlayerTeamColor(localPlayer, localPlayer))
	elseif mode == "TITLE" then
		titleData = titleData or Config.GetPlayerTitle(localPlayer)
		sidebar:SetColor(titleData.titleColor)
	end
end

--	nil UpdateHeaderTitle([table<TitleData>])
--	Updates the title of the header. The parameter is for internal use (to use cached title data, can be used to override).
local function UpdateHeaderTitle(titleData)
	-- no need to check for player validity
	-- references
	local titleText = script:GetCustomProperty("Title"):WaitForObject()
	local titleIcon = script:GetCustomProperty("TitleIcon"):WaitForObject()
	-- data
	titleData = titleData or Config.GetPlayerTitle(localPlayer)
	-- update
	-- icon
	if titleData.icon then
		titleText.x = 38 -- 67
		titleText.width = -90
		titleIcon.visibility = Visibility.INHERIT
		titleIcon.rotationAngle = titleData.iconRotation
		titleIcon.width = 20 + math.floor(titleData.iconSizeOffset.x + 0.5)
		titleIcon.height = 20 + math.floor(titleData.iconSizeOffset.y + 0.5)
		titleIcon:SetImage(titleData.icon)
		titleIcon:SetColor(titleData.iconColor)
	else
		titleText.x = 10 -- 42
		titleText.width = -65
		titleIcon.visibility = Visibility.FORCE_OFF
	end
	-- text
	titleText.text = titleData.title
	titleText:SetColor(titleData.titleColor)
	-- update name and sidebar (necessary for the TITLE color mode)
	UpdateHeaderName(titleData)
	UpdateHeaderSidebar(titleData)
end

--	nil UpdateHeader()
--	A function that updates the local header. Usually called during the initalization step.
local function UpdateHeader()
	-- no need to check for player validity
	-- update
	UpdateHeaderName()
	UpdateHeaderTitle() -- includes name and sidebar
end

--	nil UpdateEntryVisibility(Player)
--	Updates the visibility of a player's entry. Called every frame in Tick.
local function UpdateEntryVisibility(player)
	-- get entry
	local entry = RetrieveEntry(player)
	if not entry then return end
	-- update
	local v = GetEntryVisibility(localPlayer, player)
	if entry.visibility ~= v then ReorderEntries() end
	entry.visibility = v
end

--	nil UpdateEntryName(Player, [table<TitleData>])
--	Updates the name of a player's entry. The second parameter is for internal use (to use cached title data, can be used to override).
local function UpdateEntryName(player, titleData)
	-- get entry
	local entry = RetrieveEntry(player)
	if not entry then return end
	-- references
	local name = entry:GetCustomProperty("Name"):WaitForObject()
	-- data
	local mode = string.upper(Config.list.nameColorMode)
	-- update
	-- mode color
	if mode == "STATIC" then
		name:SetColor(Config.list.nameStaticColor)
	elseif mode == "TEAM" then
		name:SetColor(Config.GetPlayerTeamColor(localPlayer, player))
	elseif mode == "TITLE" then
		titleData = titleData or Config.GetPlayerTitle(player)
		name:SetColor(titleData.titleColor)
	end
	-- text
	name.text = player.name or ""
end

--	nil UpdateEntrySidebar(Player, [table<TitleData>])
--	Updates the sidebar of a player's entry. The second parameter is for internal use (to use cached title data, can be used to override).
local function UpdateEntrySidebar(player, titleData)
	-- get entry
	local entry = RetrieveEntry(player)
	if not entry then return end
	-- references
	local sidebar = entry:GetCustomProperty("Sidebar"):WaitForObject()
	-- data
	local mode = string.upper(Config.list.sidebarColorMode)
	-- update
	-- mode color
	if mode == "STATIC" then
		sidebar:SetColor(Config.list.sidebarStaticColor)
	elseif mode == "TEAM" then
		sidebar:SetColor(Config.GetPlayerTeamColor(localPlayer, player))
	elseif mode == "TITLE" then
		titleData = titleData or Config.GetPlayerTitle(player)
		sidebar:SetColor(titleData.titleColor)
	end
end

--	nil UpdateEntryTitle(Player, [table<TitleData>])
--	Updates the title of a player's entry. The second parameter is for internal use (to use cached title data, can be used to override).
local function UpdateEntryTitle(player, titleData)
	-- get entry
	local entry = RetrieveEntry(player)
	if not entry then return end
	-- references
	local titleIcon = entry:GetCustomProperty("TitleIcon"):WaitForObject()
	local name = entry:GetCustomProperty("Name"):WaitForObject()
	-- data
	titleData = titleData or Config.GetPlayerTitle(player)
	-- update
	if titleData.icon then
		name.x = 67
		name.width = -90
		titleIcon.visibility = Visibility.INHERIT
		titleIcon.rotationAngle = titleData.iconRotation
		titleIcon.width = 20 + math.floor(titleData.iconSizeOffset.x + 0.5)
		titleIcon.height = 20 + math.floor(titleData.iconSizeOffset.y + 0.5)
		titleIcon:SetImage(titleData.icon)
		titleIcon:SetColor(titleData.iconColor)
	else
		name.x = 42
		name.width = -65
		titleIcon.visibility = Visibility.FORCE_OFF
	end
	-- update name and sidebar (necessary for the TITLE color mode)
	UpdateEntryName(player, titleData)
	UpdateEntrySidebar(player, titleData)
end

--	nil UpdateEntryParty(Player, number<dt>)
--	Updates the color of a player's party icon to a color generated from their party id. Animates the party icon.
local function UpdateEntryParty(player, dt)
	-- get entry
	local entry = RetrieveEntry(player)
	if not entry then return end
	-- references
	local partyPanel = entry:GetCustomProperty("PartyPanel"):WaitForObject()
	local partyIcon = entry:GetCustomProperty("PartyIcon"):WaitForObject()
	-- data
	local v
	local color = Config.GetPlayerPartyColor(player)
	-- update
	-- visibility
	v = color and 1 or 0
	partyPanel.opacity = Config.Approach(partyPanel.opacity, v, math.abs(partyPanel.opacity - v)/8, dt)
	-- color
	if color then
		partyIcon:SetColor(color)
	end
end

--	nil UpdateEntry(Player)
--	A function that updates an entry. Usually called right after its spawned in.
local function UpdateEntry(player)
	-- get entry
	local entry = RetrieveEntry(player)
	if not entry then return end
	-- update
	UpdateEntryTitle(player)
end

--	nil UpdateListVisibility(number<dt>)
--	Animates the list on visibility switching.
local function UpdateListVisibility(dt)
	-- get height
	local height = math.min(
		entryCount*34,
		easingTarget.parent.parent.height+easingTarget.parent.height
	)
	-- get curve
	local curve = listVisibility and Config.list.easingCurveIn or Config.list.easingCurveOut
	-- calculate
	local a = curve:GetValue(listVisibilityDelta)/math.max(1, curve.maxValue)
	local y = (1-a)*-height
	-- update
	easingTarget.y = y
	easingTarget.opacity = a
	easingTarget.visibility = (opacity == 0) and Visibility.FORCE_OFF or Visibility.INHERIT
	-- iterate
	listVisibilityDelta = math.min(listVisibilityDelta + dt, curve.maxTime)
end

--	CoreObject<Entry> SpawnEntry(Player)
--	Spawns in and adds the supplied player's entry to the list.
local function SpawnEntry(player)
	-- check if the player is valid
	if not Player.IsA(player, "Player") then return end
	if not player:IsValid() then return end
	-- avoid duplicates
	if entries[player.id] then return entries[player.id] end
	-- create entry
	local entry = World.SpawnAsset(Config.list.entryTemplate, {parent = entriesScroll})
	-- hierarchy name
	entry.name = player.name
	-- avatar
	local avatar = entry:GetCustomProperty("Avatar"):WaitForObject()
	avatar:SetPlayerProfile(player)
	avatar.visibility = Visibility.INHERIT
	-- add to entry list
	entries[player.id] = entry
	entryCount = entryCount + 1
	-- update entry
	UpdateEntry(player)
	-- reorder list on modifications
	ReorderEntries()
	-- return
	return entry
end
RetrieveEntry = SpawnEntry


--	nil DestroyEntry(Player)
--	Destroys and removes the supplied player's entry from the list.
local function DestroyEntry(player)
	-- skip if already nil
	if RetrieveEntry(player) == nil then return end
	-- destroy
	entries[player.id]:Destroy()
	entries[player.id] = nil
	entryCount = entryCount - 1
	-- reorder list on modifications
	ReorderEntries()
end

--	nil Initialize()
--	Prepares the script. Loads in an entry for every connected client.
local function Initialize()
	-- load entries for all players
	local players = Game.GetPlayers()
	for i = 1, #players do
		-- for each player
		local player = players[i]
		-- spawn an entry
		local entry = RetrieveEntry(player)
	end
	-- update the header
	UpdateHeader()
end

--	nil ToggleListVisibility(_, string<keybind>)
-- 	Toggles list visibility on toggle keybind press.
local function ToggleListVisibility(_, key)
	if key == Config.list.keybindToggle then
		listVisibility = not listVisibility
		listVisibilityDelta = 0
	end
end

------------------------------------------------------------------------------------------------------------------------
--	Tick
------------------------------------------------------------------------------------------------------------------------
-- Calls all of the UI update functions when necessary.
function Tick(dt)
	-- update scoreboard
	UpdateListVisibility(dt)
	-- update entries and header
	local players = Game.GetPlayers()
	for i = 1, #players do
		-- for each player
		local player = players[i]

		-- update visibility
		UpdateEntryVisibility(player)

		-- process if visible
		if entries[player.id] and (entries[player.id].visibility ~= Visibility.FORCE_OFF) then
			-- update title on title changes
			local titleData, _ = Config.CheckTitleDelta(player)
			if titleData then
				if player == localPlayer then UpdateHeaderTitle(titleData) end
				UpdateEntryTitle(player, titleData)
			end
			-- update name and sidebar on team changes
			if Config.CheckTeamDelta(player) then
				if player == localPlayer then UpdateHeaderSidebar() UpdateHeaderName() end
				UpdateEntrySidebar(player) UpdateEntryName(player)
			end
			-- update party
			UpdateEntryParty(player, dt)
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
--	Initialization
------------------------------------------------------------------------------------------------------------------------
Game.playerJoinedEvent:Connect(RetrieveEntry)
Game.playerLeftEvent:Connect(DestroyEntry)
localPlayer.bindingPressedEvent:Connect(ToggleListVisibility)
Initialize()
