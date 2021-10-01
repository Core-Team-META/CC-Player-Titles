--[[
	Player Titles - Nameplates Handler (client)

	Contributors:
		Chipnertkj [https://www.coregames.com/user/aabffd57e2814ff1bc7f80f5fd32b5a4]
		Nicholas Foreman [https://www.coregames.com/user/f9df3457225741c89209f6d484d0eba8]

	Handles UI nameplates for every client.
]]

------------------------------------------------------------------------------------------------------------------------
--	CoreObject References
------------------------------------------------------------------------------------------------------------------------
local rootFolder = script:GetCustomProperty("RootFolder"):WaitForObject()
local nameplatesFolder = script:GetCustomProperty("NameplatesFolder"):WaitForObject()
------------------------------------------------------------------------------------------------------------------------
--	Config
------------------------------------------------------------------------------------------------------------------------
if _G.METAPlayerTitles == nil then
	_G.METAPlayerTitles = {configurator = assert(rootFolder:GetCustomProperty("Configurator"):GetObject(), "Configurator not found.")}
end
local Config = require(script:GetCustomProperty("ConfiguratorReader"))
if Config.nameplates == nil then error("Configurator doesn't include nameplate configuration data.") end
------------------------------------------------------------------------------------------------------------------------
--	Script Data
------------------------------------------------------------------------------------------------------------------------
local localPlayer = Game.GetLocalPlayer() -- local player
local nameplates = {} -- table holding all of the nameplates currently spawned
local iconEllipsisImage = script:GetCustomProperty("IconEllipsisImage")
------------------------------------------------------------------------------------------------------------------------
--	Functions
------------------------------------------------------------------------------------------------------------------------
local RetrieveNameplate -- forward declaration

--	Visibility GetNameplateVisibility(Player, Player)
--	Returns nameplate visibility based on the players' team relation and config.
function GetNameplateVisibility(player1, player2)
	if not Player.IsA(player1, "Player") then return end
	if not player1:IsValid() then return end
	if not Player.IsA(player2, "Player") then return end
	if not player2:IsValid() then return end
	-- data
	local relation = Config.GetTeamRelation(player1, player2)
	-- get
	if (relation == Config.TeamRelation.SELF) or (relation == Config.TeamRelation.SELF_NEUTRAL) then
		-- show on self?
		return Config.nameplates.showSelf and Visibility.INHERIT or Visibility.FORCE_OFF
	elseif relation == Config.TeamRelation.NEUTRAL then
		-- show on neutral?
		return Config.nameplates.showNeutral and Visibility.INHERIT or Visibility.FORCE_OFF
	elseif relation == Config.TeamRelation.FRIENDLY then
		-- show on friendly?
		return Config.nameplates.showFriendly and Visibility.INHERIT or Visibility.FORCE_OFF
	elseif relation == Config.TeamRelation.ENEMY then
		-- show on enemy?
		return Config.nameplates.showEnemy and Visibility.INHERIT or Visibility.FORCE_OFF
	end
end

--	nil UpdateNameplateHealthbarColor(Player, [table<TitleData>])
--	Sets the color of a nameplate healthbar according to the selected color mode.
--	Can be forced to use the title data (title config table from the module) supplied as the second argument (optional).
--	That will only apply if the selected mode for player healthbars is TITLE.
local function UpdateNameplateHealthbarColor(player, titleData)
	-- get nameplate
	local nameplate = RetrieveNameplate(player)
	if not nameplate then return end
	-- references
	local barValue = nameplate:GetCustomProperty("BarValue"):WaitForObject()
	-- data
	local mode = string.upper(Config.nameplates.healthbarColorMode)
	-- update
	-- mode color
	if mode == "STATIC" then
		barValue:SetColor(Config.nameplates.healthbarStaticColor)
	elseif mode == "TEAM" then
		barValue:SetColor(Config.GetPlayerTeamColor(localPlayer, player))
	elseif mode == "TITLE" then
		titleData = titleData or Config.GetPlayerTitle(player)
		barValue:SetColor(titleData.titleColor)
	end
end

--	nil UpdateNameplateHealth(Player, float<dt>)
--	Updates the value of a nameplate's healthbar over time.
local function UpdateNameplateHealth(player, dt)
	-- get nameplate
	local nameplate = RetrieveNameplate(player)
	if not nameplate then return end
	-- references
	local ui = nameplate:GetCustomProperty("UI"):WaitForObject()
	local bar = nameplate:GetCustomProperty("Healthbar"):WaitForObject()
	local barValue = nameplate:GetCustomProperty("BarValue"):WaitForObject()
	local barText = nameplate:GetCustomProperty("BarText"):WaitForObject()
	-- data
	local value = player.hitPoints/player.maxHitPoints
	local maxWidth = ui:GetCanvasSize().x + bar.width - 20
	-- update
	local v = -math.floor((1 - value) * maxWidth) - 20
	barValue.width = math.floor(Config.Approach(barValue.width, v, math.abs(barValue.width - v)/2, dt))
	barText.text = tostring(math.floor(player.hitPoints)) .. " / " .. tostring(math.floor(player.maxHitPoints))
end

--	nil UpdateNameplateName(Player, [table<TitleData>])
--	Sets the text and color of a nameplate name according to the selected color mode.
--	Can be forced to use the title data (title config table from the module) supplied as the second argument (optional).
--	That will only apply if the selected mode for player names is TITLE.
local function UpdateNameplateName(player, titleData)
	-- get nameplate
	local nameplate = RetrieveNameplate(player)
	if not nameplate then return end
	-- references
	local name = nameplate:GetCustomProperty("Name"):WaitForObject()
	-- data
	local mode = string.upper(Config.nameplates.nameColorMode)
	-- update
	-- mode color
	if mode == "STATIC" then
		name:SetColor(Config.nameplates.nameStaticColor)
	elseif mode == "TEAM" then
		name:SetColor(Config.GetPlayerTeamColor(localPlayer, player))
	elseif mode == "TITLE" then
		titleData = titleData or Config.GetPlayerTitle(player)
		name:SetColor(titleData.titleColor)
	end
	-- text
	name.text = player.name or ""
end

--	nil UpdateNameplateTitle(Player, [table<TitleData>])
--	Sets the title on a nameplate to the player's current default (or override if overriden) title.
--	Can be forced to use the title data (title config table from the module) supplied as the second argument (optional).
local function UpdateNameplateTitle(player, titleData)
	-- get nameplate
	local nameplate = RetrieveNameplate(player)
	if not nameplate then return end
	-- data
	titleData = titleData or Config.GetPlayerTitle(player)
	-- update
	local titleText = nameplate:GetCustomProperty("Title"):WaitForObject()
	titleText.text = titleData.title
	titleText:SetColor(titleData.titleColor)
	-- update name and healthbar (necessary for the TITLE color mode)
	UpdateNameplateName(player, titleData)
	UpdateNameplateHealthbarColor(player, titleData)
end

--	nil UpdateNameplateVisibility(Player)
--	Updates nameplate visibility based on the team relation of a player to the local player.
local function UpdateNameplateVisibility(player)
	-- get nameplate
	local nameplate = RetrieveNameplate(player)
	if not nameplate then return end
	-- update
	nameplate.visibility = GetNameplateVisibility(localPlayer, player)
end

--	nil UpdateVoiceChatVolume(Player, number<dt>)
--	Updates the voice chat volume display on a player's nameplate over time.
local voiceChatTimer = 0
local function UpdateVoiceChatVolume(player, dt)
	-- get nameplate
	local nameplate = RetrieveNameplate(player)
	if not nameplate then return end
	-- start timer
	if VoiceChat.IsPlayerSpeaking(player) then
		voiceChatTimer = 2
	end
	-- visualizer
	local voiceChat = nameplate:GetCustomProperty("VoiceChat"):WaitForObject()
	if voiceChatTimer > 0 then
		voiceChat.opacity = Config.Approach(voiceChat.opacity, 1, math.abs(voiceChat.opacity - 1)/4, dt)
		local voiceChatVolume = nameplate:GetCustomProperty("VoiceChatVolume"):WaitForObject()
		local v = voiceChatVolume.width * VoiceChat.GetPlayerSpeakingVolume(player)
		voiceChatVolume.height = math.floor(Config.Approach(voiceChatVolume.height, v, math.abs(voiceChatVolume.height - v)/5, dt))
		voiceChatTimer = voiceChatTimer - dt
	else
		voiceChat.opacity = Config.Approach(voiceChat.opacity, 0, math.abs(voiceChat.opacity - 0)/10, dt)
	end
end

--	nil SetNameplateIcon(Player, Integer, string<IconID>)
--	Used internally by UpdateNameplateIcons. Sets up an icon using the specified iconID.
local function SetNameplateIcon(player, index, iconID)
	-- get nameplate
	local nameplate = RetrieveNameplate(player)
	if not nameplate then return end
	-- references
	local icons = nameplate:GetCustomProperty("Icons"):WaitForObject():GetChildren()
	local icon = icons[index]:FindChildByName("Icon")
	-- data
	if Config.nameplates.icons[iconID] == nil and iconID ~= Config.handler.iconEllipsisID and iconID ~= iconID then warn("This iconID (\"" .. tostring(iconID) .. "\") doesn't have a corresponding icon in the configurator.") end
	local iconData = Config.nameplates.icons[iconID]
	-- update
	if icon == nil then error("Missing icon slot (" .. tostring(index) .. ".) in the nameplate template. If you removed any slots manually, be sure to adjust Config.handler.iconCount in the configurator.") end
	-- set
	if iconID == nil then
		-- disable
		icon.parent.visibility = Visibility.FORCE_OFF
	elseif iconID == Config.handler.iconEllipsisID then
		-- enable
		icon.parent.visibility = Visibility.INHERIT
		icon.visibility = Visibility.INHERIT
		-- set ellipsis
		icon:SetColor(Color.WHITE)
		icon:SetImage(iconEllipsisImage)
		icon.rotationAngle = 90
		icon.width = 20
		icon.height = 80
	else
		-- enable
		icon.parent.visibility = Visibility.INHERIT
		icon.visibility = Visibility.INHERIT
		-- set icon
		icon:SetImage(iconData.image)
		icon:SetColor(iconData.color)
		icon.rotationAngle = 0
		icon.width = 100
		icon.height = 100
	end
end

--	nil UpdateNameplateIcons(Player)
--	Sets icons on a player's nameplate to whatever they are set to in that player's session data (in the handler).
local function UpdateNameplateIcons(player)
	local data = Config.GetPlayerSessionData(player)
	if not data then return end
	local icons = data.icons
	-- extract ids
	local i = 0
	local iconIDs = {}
	for key in string.gmatch(icons, "[^%:]+") do
		i = i + 1
		iconIDs[i] = key
	end
	-- set icons
	for i = 1, Config.handler.iconCount do
		SetNameplateIcon(player, i, iconIDs[i])
	end
end

--	nil UpdateNameplateRotation(Player)
--	Rotates a nameplate to face the local player.
local function UpdateNameplateRotation(player)
	-- get nameplate
	local nameplate = RetrieveNameplate(player)
	if not nameplate then return end
	-- rotate
	local quaternion = Quaternion.New(localPlayer:GetViewWorldRotation())
	quaternion = quaternion * Quaternion.New(Vector3.UP, 180)
	nameplate:SetWorldRotation(Rotation.New(quaternion))
end

--	nil UpdateNameplateParty(Player, number<dt>)
--	Updates the nameplate's party color and visibility.
local function UpdateNameplateParty(player, dt)
	-- get nameplate
	local nameplate = RetrieveNameplate(player)
	if not nameplate then return end
	-- references
	local partyPanel = nameplate:GetCustomProperty("Party"):WaitForObject()
	local partyIcon = nameplate:GetCustomProperty("PartyIcon"):WaitForObject()
	-- data
	local v
	local color = Config.GetPlayerPartyColor(player)
	-- update
	-- position
	v = (voiceChatTimer <= 0) and -10 or -195
	partyPanel.x = Config.Approach(partyPanel.x, v, math.abs(partyPanel.x - v)/10, dt)
	-- visibility
	v = color and 1 or 0
	partyPanel.opacity = Config.Approach(partyPanel.opacity, v, math.abs(partyPanel.opacity - v)/8, dt)
	-- color
	if color then
		partyIcon:SetColor(color)
	end
end

--	nil UpdateNameplate(Player)
--	Calls all of the update functions for a player's nameplate (excluding tick/animation functions).
local function UpdateNameplate(player)
	-- get nameplate
	local nameplate = RetrieveNameplate(player)
	if not nameplate then return end
	-- update
	UpdateNameplateVisibility(player)
	UpdateNameplateTitle(player) -- includes name and healthbar update functions
end

--	nameplate SpawnNameplate(Player), alias: RetrieveNameplate(Player)
--	Spawns, initializes, stores, and returns the nameplate assigned to the player.
--	Only one nameplate can be assigned to a player. If a player already has a nameplate assigned, it will be returned instead.
--	The alias is used to forward declare the function at the start of the script (so that you can use it before it's defined).
local function SpawnNameplate(player)
	-- check if the player is valid
	if not Player.IsA(player, "Player") then return end
	if not player:IsValid() then return end
	-- avoid duplicates
	if nameplates[player.id] then return nameplates[player.id] end
	-- create socket helper
	local socketHelper = World.SpawnAsset(Config.nameplates.socketHelperTemplate)
	socketHelper:AttachToPlayer(player, "nameplate")
	-- create nameplate
	local nameplate = World.SpawnAsset(Config.nameplates.nameplateTemplate, {parent = nameplatesFolder})
	-- hierarchy name
	nameplate.name = player.name
	-- position
	nameplate:Follow(socketHelper)
	-- avatar
	local avatar = nameplate:GetCustomProperty("Avatar"):WaitForObject()
	avatar:SetPlayerProfile(player)
	avatar.visibility = Visibility.INHERIT
	-- add to nameplate list
	nameplates[player.id] = nameplate
	-- update nameplate
	UpdateNameplate(player)
	-- return
	return nameplate
end
RetrieveNameplate = SpawnNameplate

--	nil DestroyNameplate(Player)
--	Destroys and removes the nameplate of the specified player from the scripts nameplates table.
local function DestroyNameplate(player)
	-- skip if already nil
	if RetrieveNameplate(player) == nil then return end
	-- destroy
	nameplates[player.id]:Destroy()
	nameplates[player.id] = nil
end

--	nil Initialize()
--	Prepares the script. Loads in a nameplate for every connected client.
local function Initialize()
	local players = Game.GetPlayers()
	for i = 1, #players do
		-- for each player
		local player = players[i]
		-- spawn a nameplate
		local nameplate = RetrieveNameplate(player)
	end
end

------------------------------------------------------------------------------------------------------------------------
--	Tick
------------------------------------------------------------------------------------------------------------------------
-- Calls all of the UI update functions when necessary.
function Tick(dt)
	local players = Game.GetPlayers()
	for i = 1, #players do
		-- for each player
		local player = players[i]

		-- update visibility
		UpdateNameplateVisibility(player)

		-- process if visible
		if nameplates[player.id] and (nameplates[player.id].visibility ~= Visibility.FORCE_OFF) then
			-- rotate nameplate
			UpdateNameplateRotation(player)
			-- update title on title changes
			local titleData, _ = Config.CheckTitleDelta(player)
			if titleData then UpdateNameplateTitle(player, titleData) end
			-- update name and healthbar color on team changes
			if Config.CheckTeamDelta(player) then UpdateNameplateHealthbarColor(player) UpdateNameplateName(player) end
			-- update health
			UpdateNameplateHealth(player, dt)
			-- update icons
			UpdateNameplateIcons(player)
			-- update voice chat visualizer
			UpdateVoiceChatVolume(player, dt)
			-- update party color and position (voice chat offset)
			UpdateNameplateParty(player, dt)
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
--	Initialization
------------------------------------------------------------------------------------------------------------------------
Game.playerJoinedEvent:Connect(RetrieveNameplate)
Game.playerLeftEvent:Connect(DestroyNameplate)
Initialize()
