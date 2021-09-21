--[[
	Player Titles - Configuration Reader (module, context dependent)

	Contributors:
		Chipnertkj [https://www.coregames.com/user/aabffd57e2814ff1bc7f80f5fd32b5a4]
		Nicholas Foreman [https://www.coregames.com/user/f9df3457225741c89209f6d484d0eba8]

	Reads data from the supplied configurator (_G.METAPlayerTitles.configurator) and packages it nicely into a module (Config).
]]

------------------------------------------------------------------------------------------------------------------------
--	Config Module
------------------------------------------------------------------------------------------------------------------------
if _G.METAPlayerTitles.Config ~= nil then return _G.METAPlayerTitles.Config end
local Config = {}
------------------------------------------------------------------------------------------------------------------------
--	Configurator
------------------------------------------------------------------------------------------------------------------------
local configurator = _G.METAPlayerTitles.configurator
local isServer = Environment.IsServer()
-- configurator entries
local configuratorCommon = configurator:FindChildByName("Common")
local configuratorTitles = configurator:FindChildByName("Titles")
local configuratorNameplates = configurator:FindChildByName("Nameplates")
local configuratorList = configurator:FindChildByName("List")
local configuratorScoreboard = configurator:FindChildByName("Scoreboard")
local configuratorHandler = configurator:FindChildByName("Handler")
------------------------------------------------------------------------------------------------------------------------
--	Override Functions
------------------------------------------------------------------------------------------------------------------------
do
	-- nil SetOverrideTitle(Player, string)
	-- Defined in METAPlayerTitles_Handler.lua
	-- Sets a player's override title to the provided title. The title will be reset if the title parameter is nil.
	if isServer then Config.SetOverrideTitle = nil else
		function Config.SetOverrideTitle(player, title)
			error("This function can be only called from the server.")
		end
	end

	-- nil CreateOverrideTitle(string)
	-- Defined in METAPlayerTitles_Handler.lua
	-- Creates a custom title to be used when overriding titles. This title can be modified.
	-- The provided name will be used to access the tile in code.
	if isServer then Config.CreateOverrideTitle = nil else
		function Config.CreateOverrideTitle(name)
			error("This function can be only called from the server.")
		end
	end
end
------------------------------------------------------------------------------------------------------------------------
--	Module Enums
------------------------------------------------------------------------------------------------------------------------
do
	Config.TeamRelation = {
		NEUTRAL = 1,
		SELF = 2,
		FRIENDLY = 3,
		ENEMY = 4,
		SELF_NEUTRAL = 5,
	}
end
------------------------------------------------------------------------------------------------------------------------
--	Module Functions
------------------------------------------------------------------------------------------------------------------------
do
	--	titleData|nil, title|nil CheckTitleDelta(player)
	--	Returns the titleData and title of a player after detecting title changes for that player.
	--	Otherwise returns nil.
	local deltaTitles = {}
	function Config.CheckTitleDelta(player)
		-- check if the player is valid
		if not Player.IsA(player, "Player") then return end
		if not player:IsValid() then return end
		-- get data
		local titleData, title = Config.GetPlayerTitle(player)
		-- resolve
		if deltaTitles[player.id] == title then
			return nil
		else
			deltaTitles[player.id] = title
			return titleData, title
		end
	end

	--	bool CheckTeamDelta(player)
	--	Returns true after detecting team changes for the specified player.
	--	Otherwise returns false.
	local deltaTeams = {}
	function Config.CheckTeamDelta(player)
		-- check if the player is valid
		if not Player.IsA(player, "Player") then return end
		if not player:IsValid() then return end
		-- resolve
		if deltaTeams[player.id] == player.team then
			return false
		else
			deltaTeams[player.id] = player.team
			return true
		end
	end

	-- float Approach(float, float, float, float)
	-- Utility function. Interpolates a to b by c over time. Delta time is optional and makes it account for variable/different framerates.
	function Config.Approach(a, b, c, dt)
		if dt then c = c * (dt*60) end
		if a < b then a = a + c end
		if a > b then a = a - c end
		return a
	end

	-- any PropertyAssert(CoreObject, string)
	-- Returns a custom property of the supplied CoreObject and checks it for nil.
	function Config.PropertyAssert(coreObject, propertyName)
		-- check for coreObject
		if coreObject == nil then
			error("Argument coreObject is nil (propertyName: " .. tostring(propertyName) .. ").")
		end
		-- get property
		local property = coreObject:GetCustomProperty(tostring(propertyName))
		-- check for property
		if property == nil then
			error("Custom property \"" .. tostring(propertyName) .. "\" not set on object " .. tostring(coreObject) .. ".")
		end
		-- return property
		return property
	end

	--	TeamRelation GetTeamRelation(Player, Player)
	--	Returns the Config.TeamRelation between two players
	function Config.GetTeamRelation(player1, player2)
		if not Player.IsA(player1, "Player") then return end
		if not Player.IsA(player2, "Player") then return end
		-- get
		if(player1 == player2) then
			if(player1.team == 0) then
				return Config.TeamRelation.SELF_NEUTRAL
			else
				return Config.TeamRelation.SELF
			end
		elseif(player2.team == 0) then
			return Config.TeamRelation.NEUTRAL
		elseif(Teams.AreTeamsFriendly(player2.team, player1.team)) then
			return Config.TeamRelation.FRIENDLY
		else
			return Config.TeamRelation.ENEMY
		end
	end

	--	Player|nil GetPlayerById(playerId)
	--	Goes through the player list and looks for a player with the matching id. Returns nil if the attempt was unsuccessful.
	function Config.GetPlayerById(id)
		local players = Game.GetPlayers()
		for i = 1, #players do
			if players[i].id == id then return players[i] end
		end
	end

	--	Color GetPlayerTeamColor(Player, Player)
	--	Returns the respective color for player2's team relation to player1
	function Config.GetPlayerTeamColor(player1, player2)
		if not Player.IsA(player1, "Player") then return end
		if not player1:IsValid() then return end
		if not Player.IsA(player2, "Player") then return end
		if not player2:IsValid() then return end
		-- data
		local teamRelation = Config.GetTeamRelation(player1, player2)
		-- get
		if(teamRelation == Config.TeamRelation.SELF) then
			return Config.common.teamFriendlyColor
		elseif(teamRelation == Config.TeamRelation.SELF_NEUTRAL) then
			return Config.common.teamSelfColor
		elseif(teamRelation == Config.TeamRelation.NEUTRAL) then
			return Config.common.teamNeutralColor
		elseif(teamRelation == Config.TeamRelation.FRIENDLY) then
			return Config.common.teamFriendlyColor
		elseif(teamRelation == Config.TeamRelation.ENEMY) then
			return Config.common.teamEnemyColor
		end
	end

	--	Color|nil GetPlayerPartyColor(Player)
	--	Returns a color genrated from the id of the player's party (the result is cached so it's not costly at all).
	--	Returns nil if the player doesn't belong to any party.
	local playerPartyColorResults = {}
	function Config.GetPlayerPartyColor(player, debug)
		if not Player.IsA(player, "Player") then return end
		if not player:IsValid() then return end
		-- get id and return precalculated results if any for this id
		local partyInfo
		if player.isInParty then partyInfo = player:GetPartyInfo() end
		local baseID = partyInfo and partyInfo.id or debug
		if playerPartyColorResults[baseID] then return playerPartyColorResults[baseID] end
		local s = baseID
		if not s then return end
		-- calculate
		-- non-hex to 0
		s = string.lower(s)
		s = string.gsub(s, "[^0123456789abcdef]", "0")
		-- add 0 until len%3
		while string.len(s) %3 ~= 0 do
			s = s .. "0"
		end
		-- split into rgb
		local l = string.len(s)/3
		local r = string.sub(s, 1, l)
		local g = string.sub(s, l+1, l*2)
		local b = string.sub(s, l*2+1, -1)
		-- remove all 0s from the beggining (if symmetrical)
		while (
		(string.len(r) > 2 or string.len(g) > 2 or string.len(b) > 2) and
			(
				(string.sub(r, 1, 1) == "0") and
				(string.sub(g, 1, 1) == "0") and
				(string.sub(g, 1, 1) == "0")
			)
		) do
			r = string.sub(r, 2, -1)
			g = string.sub(g, 2, -1)
			b = string.sub(b, 2, -1)
		end
		-- truncate to 2
		r = string.sub(r, 1, 2)
		g = string.sub(g, 1, 2)
		b = string.sub(b, 1, 2)
		-- calculate hex
		r, g, b = tonumber("0x" .. r), tonumber("0x" .. g), tonumber("0x" .. b)
		-- return
		local result = Color.New(r, g, b)
		playerPartyColorResults[baseID] = result
		return result
	end

	-- table|nil GetPlayerSessionData(Player)
	-- Returns the session data for a player.
	function Config.GetPlayerSessionData(player)
		if not Player.IsA(player, "Player") then return end
		-- get player data
		local playerData = Config.handler.playerDataFolder:FindChildByName(tostring(player.id))
		if playerData == nil then return end
		-- read and package player data
		local data = {}
		data.icons = Config.PropertyAssert(playerData, "Icons")
		data.overrideTitle = Config.PropertyAssert(playerData, "OverrideTitle")
		data.overrideTitle = data.overrideTitle ~= "" and data.overrideTitle or nil
		-- return player data
		return data
	end

	-- table|nil GetTitleSessionData(string)
	-- Returns the title session data for the supplied title.
	function Config.GetTitleSessionData(title)
		-- get title data
		local titleObject = Config.handler.titleDataFolder:FindChildByName(tostring(title))
		if titleObject == nil then return end
		-- read and package player data
		local title = {}
		-- read entry config
		title.title = Config.PropertyAssert(titleObject, "Title")
		title.titleColor = Config.PropertyAssert(titleObject, "TitleColor")
		title.icon = titleObject:GetCustomProperty("Icon") -- no assert on purpose
		title.iconColor = Config.PropertyAssert(titleObject, "IconColor")
		title.iconSizeOffset = Config.PropertyAssert(titleObject, "IconSizeOffset")
		title.isModerator = Config.PropertyAssert(titleObject, "IsModerator")
		title.members = {}
		-- read members
		local membersEntries = titleObject:GetChildren()
		for i = 1, #membersEntries do
			-- process member i
			local memberObject = membersEntries[i]
			local member = {}
			title.members[memberObject.name] = member
			-- read member config
			member.id = Config.PropertyAssert(memberObject, "PlayerMUID")
		end
		-- return player data
		return title
	end

	-- table|nil GetTitleData(string)
	-- Returns the title data for the supplied title.
	function Config.GetTitleData(title)
		-- set result to proper title data OR the default title config key
		local result = title and (Config.GetTitleSessionData(title) or Config.titles[title]) or Config.common.defaultTitle
		if result == Config.common.defaultTitle then
			-- if set to default title config key, return its data and the key
			return Config.titles[Config.common.defaultTitle], Config.common.defaultTitle
		elseif title then
			-- else if title isn't nil, return the proper data and the title (key)
			return result, title
		end
	end

	-- table|nil, string|nil GetPlayerTitle(string)
	-- Returns the title data and key its title config key for the supplied player.
	function Config.GetPlayerTitle(player)
		if not Player.IsA(player, "Player") then return end
		if Config.players == nil then return end
		-- get override title
		local playerData = Config.GetPlayerSessionData(player)
		local title = ((playerData and playerData.overrideTitle) or (Config.players[player.id] and Config.players[player.id].title))
		return Config.GetTitleData(title)
	end
end
------------------------------------------------------------------------------------------------------------------------
--	Player Data
------------------------------------------------------------------------------------------------------------------------
do
	Config.players = {}
end
------------------------------------------------------------------------------------------------------------------------
--	Common Data
------------------------------------------------------------------------------------------------------------------------
do
	Config.common = {}
	-- default title
	Config.common.defaultTitle = Config.PropertyAssert(configurator:FindChildByName("Titles"), "DefaultTitle"):WaitForObject().name
	-- team colors
	Config.common.teamNeutralColor = Config.PropertyAssert(configuratorCommon, "TeamNeutralColor")
	Config.common.teamSelfColor = Config.PropertyAssert(configuratorCommon, "TeamSelfColor")
	Config.common.teamFriendlyColor = Config.PropertyAssert(configuratorCommon, "TeamFriendlyColor")
	Config.common.teamEnemyColor = Config.PropertyAssert(configuratorCommon, "TeamEnemyColor")
end
------------------------------------------------------------------------------------------------------------------------
--	Titles Data
------------------------------------------------------------------------------------------------------------------------
do
	Config.titles = {}
	-- read entries
	local titlesEntries = configuratorTitles:GetChildren()
	for i = 1, #titlesEntries do
		-- process entry i
		local titleObject = titlesEntries[i]
		local title = {}
		Config.titles[titleObject.name] = title
		-- read entry config
		title.title = Config.PropertyAssert(titleObject, "Title")
		title.titleColor = Config.PropertyAssert(titleObject, "TitleColor")
		title.icon = titleObject:GetCustomProperty("Icon") -- no assert on purpose
		title.iconColor = Config.PropertyAssert(titleObject, "IconColor")
		title.iconRotation = Config.PropertyAssert(titleObject, "IconRotation")
		title.iconSizeOffset = Config.PropertyAssert(titleObject, "IconSizeOffset")
		title.isModerator = Config.PropertyAssert(titleObject, "IsModerator")
		title.members = {}
		-- read members
		local membersEntries = titleObject:GetChildren()
		for i = 1, #membersEntries do
			-- process member i
			local memberObject = membersEntries[i]
			local member = {}
			title.members[memberObject.name] = member
			-- read member config
			member.id = Config.PropertyAssert(memberObject, "PlayerMUID")
			-- add title to player
			local player = Config.players[member.id] or {}
			player.title = titleObject.name
			Config.players[member.id] = player
		end
	end
end
------------------------------------------------------------------------------------------------------------------------
--	Handler Data
------------------------------------------------------------------------------------------------------------------------
do
	Config.handler = {}
	-- handler
	Config.handler.handlerInstance = assert(Config.PropertyAssert(configuratorHandler, "HandlerInstance"):WaitForObject(), ("Property \"Handler Instance\" set on object " .. tostring(configuratorHandler) .. " doesn't point to a valid object."))
	-- session data templates
	Config.handler.playerSessionDataTemplate = Config.PropertyAssert(configuratorHandler, "PlayerSessionDataTemplate")
	Config.handler.titleSessionDataTemplate = Config.PropertyAssert(configuratorHandler, "TitleSessionDataTemplate")
	-- session data
	local sessionDataFolder = Config.handler.handlerInstance:FindChildByName("Session Data")
	Config.handler.playerDataFolder = sessionDataFolder:FindChildByName("Player Data")
	Config.handler.titleDataFolder = sessionDataFolder:FindChildByName("Title Data")
	-- nameplate icons
	Config.handler.iconCount = Config.PropertyAssert(configuratorHandler, "IconCount")
	Config.handler.iconEllipsisID = Config.PropertyAssert(configuratorHandler, "IconEllipsisID")
	Config.handler.iconEllipsisImage = Config.PropertyAssert(configuratorHandler, "IconEllipsisImage")
end
------------------------------------------------------------------------------------------------------------------------
--	Nameplates Data
------------------------------------------------------------------------------------------------------------------------
if configuratorNameplates then
	Config.nameplates = {}
	
	-- icons
	do
		Config.nameplates.icons = {}
		-- read entries
		local iconsFolder = configuratorNameplates:FindChildByName("Icons")
		local iconsEntries = iconsFolder:GetChildren()
		for i = 1, #iconsEntries do
			-- process entry i
			local iconObject = iconsEntries[i]
			local icon = {}
			Config.nameplates.icons[iconObject.name] = icon
			-- read entry config
			icon.image = Config.PropertyAssert(iconObject, "Image")
			icon.color = Config.PropertyAssert(iconObject, "Color")
		end
	end

	-- read properties
	-- color modes
	Config.nameplates.nameColorMode = Config.PropertyAssert(configuratorNameplates, "NameColorMode")
	Config.nameplates.healthbarColorMode = Config.PropertyAssert(configuratorNameplates, "HealthbarColorMode")
	-- static colors
	Config.nameplates.nameStaticColor = Config.PropertyAssert(configuratorNameplates, "NameStaticColor")
	Config.nameplates.healthbarStaticColor = Config.PropertyAssert(configuratorNameplates, "HealthbarStaticColor")
	-- nameplate visibility
	Config.nameplates.showSelf = Config.PropertyAssert(configuratorNameplates, "ShowSelf")
	Config.nameplates.showNeutral = Config.PropertyAssert(configuratorNameplates, "ShowNeutral")
	Config.nameplates.showEnemy = Config.PropertyAssert(configuratorNameplates, "ShowEnemy")
	Config.nameplates.showFriendly = Config.PropertyAssert(configuratorNameplates, "ShowFriendly")
	-- templates
	Config.nameplates.nameplateTemplate = Config.PropertyAssert(configuratorNameplates, "NameplateTemplate")
	Config.nameplates.socketHelperTemplate = Config.PropertyAssert(configuratorNameplates, "SocketHelperTemplate")

	-- test properties
	-- NameColorMode
	local mode
	mode = string.upper(Config.nameplates.nameColorMode)
	if (mode ~= "STATIC" and mode ~= "TEAM" and mode ~= "TITLE") then
		error("Invalid value in property NameColorMode (\"" .. tostring(Config.nameplates.nameColorMode) .. "\").")
	end
	-- HealthbarColorMode
	mode = string.upper(Config.nameplates.healthbarColorMode)
	if (mode ~= "STATIC" and mode ~= "TEAM" and mode ~= "TITLE") then
		error("Invalid value in property HealthbarColorMode (\"" .. tostring(Config.nameplates.healthbarColorMode) .. "\").")
	end
end
------------------------------------------------------------------------------------------------------------------------
--	List Data
------------------------------------------------------------------------------------------------------------------------
if configuratorList then
	Config.list = {}
	
	-- read properties
	-- color modes
	Config.list.nameColorMode = Config.PropertyAssert(configuratorList, "NameColorMode")
	Config.list.sidebarColorMode = Config.PropertyAssert(configuratorList, "SidebarColorMode")
	-- static colors
	Config.list.nameStaticColor = Config.PropertyAssert(configuratorList, "NameStaticColor")
	Config.list.sidebarStaticColor = Config.PropertyAssert(configuratorList, "SidebarStaticColor")
	-- nameplate visibility
	Config.list.showSelf = Config.PropertyAssert(configuratorList, "ShowSelf")
	Config.list.showNeutral = Config.PropertyAssert(configuratorList, "ShowNeutral")
	Config.list.showEnemy = Config.PropertyAssert(configuratorList, "ShowEnemy")
	Config.list.showFriendly = Config.PropertyAssert(configuratorList, "ShowFriendly")
	-- keybinds
	Config.list.keybindToggle = Config.PropertyAssert(configuratorList, "KeybindToggle")
	-- easing
	Config.list.easingCurveIn = Config.PropertyAssert(configuratorScoreboard, "EasingCurveIn")
	Config.list.easingCurveOut = Config.PropertyAssert(configuratorScoreboard, "EasingCurveOut")
	-- templates
	Config.list.entryTemplate = Config.PropertyAssert(configuratorList, "EntryTemplate")
end
------------------------------------------------------------------------------------------------------------------------
--	Scoreboard Data
------------------------------------------------------------------------------------------------------------------------
if configuratorScoreboard then
	Config.scoreboard = {}
	do
		Config.scoreboard.scores = {}
		-- read entries
		local scoresFolder = configuratorScoreboard:FindChildByName("Scores")
		local scoresEntries = scoresFolder:GetChildren()
		for i = 1, #scoresEntries do
			-- process entry i
			local scoreObject = scoresEntries[i]
			local score = {}
			Config.scoreboard.scores[i] = score
			-- read entry config
			score.name = scoreObject.name
			score.usePlayerResources = Config.PropertyAssert(scoreObject, "UsePlayerResources")
			score.valueSource = Config.PropertyAssert(scoreObject, "ValueSource")
			score.isEnabled = Config.PropertyAssert(scoreObject, "IsEnabled")
		end
	end

	-- read properties
	-- color modes
	Config.scoreboard.nameColorMode = Config.PropertyAssert(configuratorScoreboard, "NameColorMode")
	Config.scoreboard.sidebarColorMode = Config.PropertyAssert(configuratorScoreboard, "SidebarColorMode")
	-- static colors
	Config.scoreboard.nameStaticColor = Config.PropertyAssert(configuratorScoreboard, "NameStaticColor")
	Config.scoreboard.sidebarStaticColor = Config.PropertyAssert(configuratorScoreboard, "SidebarStaticColor")
	-- nameplate visibility
	Config.scoreboard.showSelf = Config.PropertyAssert(configuratorScoreboard, "ShowSelf")
	Config.scoreboard.showNeutral = Config.PropertyAssert(configuratorScoreboard, "ShowNeutral")
	Config.scoreboard.showEnemy = Config.PropertyAssert(configuratorScoreboard, "ShowEnemy")
	Config.scoreboard.showFriendly = Config.PropertyAssert(configuratorScoreboard, "ShowFriendly")
	-- keybinds
	Config.scoreboard.keybindToggle = Config.PropertyAssert(configuratorScoreboard, "KeybindToggle")
	-- easing
	Config.scoreboard.easingCurveIn = Config.PropertyAssert(configuratorScoreboard, "EasingCurveIn")
	Config.scoreboard.easingCurveOut = Config.PropertyAssert(configuratorScoreboard, "EasingCurveOut")
	-- templates
	Config.scoreboard.entryTemplate = Config.PropertyAssert(configuratorScoreboard, "EntryTemplate")
	Config.scoreboard.entryScoreTemplate = Config.PropertyAssert(configuratorScoreboard, "EntryScoreTemplate")
	Config.scoreboard.headerScoreTemplate = Config.PropertyAssert(configuratorScoreboard, "HeaderScoreTemplate")
end
------------------------------------------------------------------------------------------------------------------------
--	Return
------------------------------------------------------------------------------------------------------------------------
_G.METAPlayerTitles.Config = Config
return _G.METAPlayerTitles.Config