--[[
	Player Titles - Scoreboard Handler (client)

	Contributors:
		Chipnertkj [https://www.coregames.com/user/aabffd57e2814ff1bc7f80f5fd32b5a4]
		Nicholas Foreman [https://www.coregames.com/user/f9df3457225741c89209f6d484d0eba8]

	Handles the player scoreboard UI for every client.
]]

------------------------------------------------------------------------------------------------------------------------
--	CoreObject References
------------------------------------------------------------------------------------------------------------------------
local rootFolder = script:GetCustomProperty("RootFolder"):WaitForObject()
local easingTarget = script:GetCustomProperty("EasingTarget"):WaitForObject()
local scoreNamesPanel = script:GetCustomProperty("ScoreNames"):WaitForObject()
local entriesScroll = script:GetCustomProperty("Entries"):WaitForObject()
------------------------------------------------------------------------------------------------------------------------
--	Config
------------------------------------------------------------------------------------------------------------------------
if _G.METAPlayerTitles == nil then
	_G.METAPlayerTitles = {configurator = assert(rootFolder:GetCustomProperty("Configurator"):GetObject(), "Configurator not found.")}
end
local Config = require(script:GetCustomProperty("ConfiguratorReader"))
if Config.scoreboard == nil then error("Configurator doesn't include scoreboard configuration data.") end
------------------------------------------------------------------------------------------------------------------------
--	Script Data
------------------------------------------------------------------------------------------------------------------------
local localPlayer = Game.GetLocalPlayer() -- local player
local entries = {} -- table holding all of the spawned scoreboard entries
local entryScores = {} -- table holding all of the spawned entry scores
local headerScores = {} -- table holding all of the spawned header scores
local scoreboardVisibility = false
local scoreboardVisibilityDelta = 0
------------------------------------------------------------------------------------------------------------------------
--	Functions
------------------------------------------------------------------------------------------------------------------------
local RetrieveEntry -- forward declaration

--	nil ReorderEntries()
--	Reorders all entries. Called after removing/adding them to the scoreboard.
local function ReorderEntries()
	local i = 0
	for _, entry in pairs(entries) do
		entry.y = 34*i
		if entry.visibility ~= Visibility.FORCE_OFF then
			i = i + 1
		end
	end
end

--	Returns the visibility that an entry should use, based on the team relation and config settings.
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
		return Config.scoreboard.showSelf and Visibility.INHERIT or Visibility.FORCE_OFF
	elseif relation == Config.TeamRelation.NEUTRAL then
		-- show on neutral?
		return Config.scoreboard.showNeutral and Visibility.INHERIT or Visibility.FORCE_OFF
	elseif relation == Config.TeamRelation.FRIENDLY then
		-- show on friendly?
		return Config.scoreboard.showFriendly and Visibility.INHERIT or Visibility.FORCE_OFF
	elseif relation == Config.TeamRelation.ENEMY then
		-- show on enemy?
		return Config.scoreboard.showEnemy and Visibility.INHERIT or Visibility.FORCE_OFF
	end
end

--	nil UpdateHeaderName(titleData)
--	Updates the name of the header. The parameter is for internal use (to use cached title data, can be used to override).
local function UpdateHeaderName(titleData)
	-- no need to check for player validity
	-- references
	local name = script:GetCustomProperty("Name"):WaitForObject()
	-- data
	local mode = string.upper(Config.scoreboard.nameColorMode)
	-- update
	-- mode color
	if mode == "STATIC" then
		name:SetColor(Config.scoreboard.nameStaticColor)
	elseif mode == "TEAM" then
		name:SetColor(Config.GetPlayerTeamColor(localPlayer, localPlayer))
	elseif mode == "TITLE" then
		titleData = titleData or Config.GetPlayerTitle(localPlayer)
		name:SetColor(titleData.titleColor)
	end
	-- text
	name.text = localPlayer.name or ""
end

--	nil UpdateHeaderSidebar(titleData)
--	Updates the sidebar of the header. The parameter is for internal use (to use cached title data, can be used to override).
local function UpdateHeaderSidebar(titledata)
	-- no need to check for player validity
	-- references
	local sidebar = script:GetCustomProperty("Sidebar"):WaitForObject()
	-- data
	local mode = string.upper(Config.scoreboard.sidebarColorMode)
	-- update
	-- mode color
	if mode == "STATIC" then
		sidebar:SetColor(Config.scoreboard.sidebarStaticColor)
	elseif mode == "TEAM" then
		sidebar:SetColor(Config.GetPlayerTeamColor(localPlayer, localPlayer))
	elseif mode == "TITLE" then
		titleData = titleData or Config.GetPlayerTitle(localPlayer)
		sidebar:SetColor(titleData.titleColor)
	end
end

--	nil UpdateHeaderTitle(titleData)
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

--	nil UpdateEntryVisibility(player)
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

--	nil UpdateEntryName(player, titleData)
--	Updates the name of a player's entry. The second parameter is for internal use (to use cached title data, can be used to override).
local function UpdateEntryName(player, titleData)
	-- get entry
	local entry = RetrieveEntry(player)
	if not entry then return end
	-- references
	local name = entry:GetCustomProperty("Name"):WaitForObject()
	-- data
	local mode = string.upper(Config.scoreboard.nameColorMode)
	-- update
	-- mode color
	if mode == "STATIC" then
		name:SetColor(Config.scoreboard.nameStaticColor)
	elseif mode == "TEAM" then
		name:SetColor(Config.GetPlayerTeamColor(localPlayer, player))
	elseif mode == "TITLE" then
		titleData = titleData or Config.GetPlayerTitle(player)
		name:SetColor(titleData.titleColor)
	end
	-- text
	name.text = player.name or ""
end

--	nil UpdateEntrySidebar(player, titleData)
--	Updates the sidebar of a player's entry. The second parameter is for internal use (to use cached title data, can be used to override).
local function UpdateEntrySidebar(player, titleData)
	-- get entry
	local entry = RetrieveEntry(player)
	if not entry then return end
	-- references
	local sidebar = entry:GetCustomProperty("Sidebar"):WaitForObject()
	-- data
	local mode = string.upper(Config.scoreboard.sidebarColorMode)
	-- update
	-- mode color
	if mode == "STATIC" then
		sidebar:SetColor(Config.scoreboard.sidebarStaticColor)
	elseif mode == "TEAM" then
		sidebar:SetColor(Config.GetPlayerTeamColor(localPlayer, player))
	elseif mode == "TITLE" then
		titleData = titleData or Config.GetPlayerTitle(player)
		sidebar:SetColor(titleData.titleColor)
	end
end

--	nil UpdateEntryTitle(player, titleData)
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

--	nil UpdateEntryParty(player, float)
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

--	nil UpdateEntry(player)
--	A function that updates an entry. Usually called right after its spawned in.
local function UpdateEntry(player)
	-- get entry
	local entry = RetrieveEntry(player)
	if not entry then return end
	-- update
	UpdateEntryTitle(player)
end

local function UpdateEntryScore(player, index)
	if not Player.IsA(player, "Player") then return end
	if not player:IsValid() then return end
	-- data
	local entryScore = entryScores[player.id][index]
	local score = Config.scoreboard.scores[index]
	-- validate entry
	if not score then return end
	if not entryScore then return end
	-- update
	if score.usePlayerResources then
		entryScore:GetCustomProperty("Value"):GetObject().text = tostring(player:GetResource(score.valueSource))
	else
		entryScore:GetCustomProperty("Value"):GetObject().text = tostring(player[score.valueSource])
	end
end

local function UpdateEntryScores(player)
	if not Player.IsA(player, "Player") then return end
	if not player:IsValid() then return end
	-- update
	for i = 1, #entryScores[player.id] do
		UpdateEntryScore(player, i)
	end
end

local function UpdateScoreboardVisibility(dt)
	-- get curve
	local curve = scoreboardVisibility and Config.scoreboard.easingCurveIn or Config.scoreboard.easingCurveOut
	-- calculate
	local y = curve:GetValue(scoreboardVisibilityDelta)
	local a = y/math.max(1, curve.maxValue)
	-- update
	easingTarget.y = y
	easingTarget.opacity = a
	easingTarget.visibility = (opacity == 0) and Visibility.FORCE_OFF or Visibility.INHERIT
	-- iterate
	scoreboardVisibilityDelta = math.min(scoreboardVisibilityDelta + dt, curve.maxTime)
end

--	entry SpawnEntry(player)
--	Spawns in and adds the supplied player's entry to the scoreboard.
local function SpawnEntry(player)
	-- check if the player is valid
	if not Player.IsA(player, "Player") then return end
	if not player:IsValid() then return end
	-- avoid duplicates
	if entries[player.id] then return entries[player.id] end
	-- create entry
	local entry = World.SpawnAsset(Config.scoreboard.entryTemplate, {parent = entriesScroll})
	-- hierarchy name
	entry.name = player.name
	-- avatar
	local avatar = entry:GetCustomProperty("Avatar"):WaitForObject()
	avatar:SetPlayerProfile(player)
	avatar.visibility = Visibility.INHERIT
	-- add to entry scoreboard
	entries[player.id] = entry
	-- update entry
	UpdateEntry(player)
	-- reorder scoreboard on modifications
	ReorderEntries()
	-- return
	return entry
end
RetrieveEntry = SpawnEntry


--	nil DestroyEntry(player)
--	Destroys and removes the supplied player's entry from the scoreboard.
local function DestroyEntry(player)
	-- skip if already nil
	if RetrieveEntry(player) == nil then return end
	-- destroy
	entries[player.id]:Destroy()
	entries[player.id] = nil
	-- reorder scoreboard on modifications
	ReorderEntries()
end

local function ReloadScores()
	-- data
	local players = Game.GetPlayers()
	-- remove existing scores
	for _, v in pairs(entryScores) do
		for i = 1, #v do
			v[i]:Destroy()
			v[i] = nil
		end
	end
	for i = 1, #headerScores do
		headerScores[i]:Destroy()
		headerScores[i] = nil
	end
	-- default all entries
	for i = 1, #players do
		local player = players[i]
		local entry = RetrieveEntry(player)
		if entry then
			entry:GetCustomProperty("MainPanel"):GetObject().width = 0
		end
	end
	-- load in scores
	local j = 0
	for i = 1, #Config.scoreboard.scores do
		local score = Config.scoreboard.scores[i]
		-- spawn
		-- entry scores
		for k = 1, #players do
			local player = players[k]
			local entry = RetrieveEntry(player)
			if entry then
				local mainPanel = entry:GetCustomProperty("MainPanel"):GetObject()
				local entryScore = World.SpawnAsset(Config.scoreboard.entryScoreTemplate, {parent = entry:GetCustomProperty("ScorePanel"):GetObject()})
				entryScores[player.id] = entryScores[player.id] or {}
				entryScores[player.id][#entryScores[player.id]+1] = entryScore
				-- init
				entryScore.name = tostring(k)
				if score.isEnabled then
					entryScore.x = j * -100
					mainPanel.width = mainPanel.width - 100
				else
					entryScore.visibility = Visibility.FORCE_OFF
				end
				-- update
				UpdateEntryScore(player, i)
			end
		end
		-- header scores
		local headerScore = World.SpawnAsset(Config.scoreboard.headerScoreTemplate, {parent = scoreNamesPanel})
		headerScores[#headerScores+1] = headerScore
		-- init
		if score.isEnabled then
			headerScore.x = j * -100
		else
			headerScore.visibility = Visibility.FORCE_OFF
		end
		headerScore.name = tostring(i)
		headerScore.text = score.name

		-- iterate
		if score.isEnabled then
			j = j + 1
		end
	end
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
	-- reload scores
	ReloadScores()
	-- update the header
	UpdateHeader()
end

--	nil ToggleScoreboardVisibility(_, string)
-- 	Toggles scoreboard visibility on toggle keybind press.
local function ToggleScoreboardVisibility(_, key)
	if key == Config.scoreboard.keybindToggle then
		scoreboardVisibility = not scoreboardVisibility
		scoreboardVisibilityDelta = 0
	end
end

------------------------------------------------------------------------------------------------------------------------
--	Tick
------------------------------------------------------------------------------------------------------------------------
-- Calls all of the UI update functions when necessary.
function Tick(dt)
	-- update scoreboard
	UpdateScoreboardVisibility(dt)
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
			-- update scores
			UpdateEntryScores(player)
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
--	Initialization
------------------------------------------------------------------------------------------------------------------------
Game.playerJoinedEvent:Connect(RetrieveEntry)
Game.playerLeftEvent:Connect(DestroyEntry)
localPlayer.bindingPressedEvent:Connect(ToggleScoreboardVisibility)
Initialize()