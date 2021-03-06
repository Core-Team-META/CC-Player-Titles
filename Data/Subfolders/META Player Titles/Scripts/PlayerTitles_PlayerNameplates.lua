--[[

	Player Titles - Player Nameplates (Client)
	1.0.9 - 2021/7/27
	Contributors
		Nicholas Foreman (https://www.coregames.com/user/f9df3457225741c89209f6d484d0eba8)
		Chipnertkj (https://www.coregames.com/user/aabffd57e2814ff1bc7f80f5fd32b5a4)

--]]

------------------------------------------------------------------------------------------------------------------------
--	EXTERNAL SCRIPTS AND APIS
------------------------------------------------------------------------------------------------------------------------
local PlayerTitles = require(script:GetCustomProperty("PlayerTitles"))
local IconAssets = require(script:GetCustomProperty("NameplateIconAssets"))

------------------------------------------------------------------------------------------------------------------------
--	OBJECTS AND REFERENCES
------------------------------------------------------------------------------------------------------------------------
local PlayerNameplates = script:GetCustomProperty("PlayerNameplates"):WaitForObject()
local NameplateTemplate = script:GetCustomProperty("NameplateTemplate")
local SocketPositionTemplate = script:GetCustomProperty("SocketPositionTemplate")
local clampIcon = script:GetCustomProperty("ClampIcon")

local LocalPlayer = Game.GetLocalPlayer()

------------------------------------------------------------------------------------------------------------------------
--	CONSTANTS
------------------------------------------------------------------------------------------------------------------------
local PLAYER_NAME_COLOR_MODE = PlayerNameplates:GetCustomProperty("PlayerNameColorMode")
local PLAYER_NAME_COLOR = PlayerNameplates:GetCustomProperty("PlayerNameColor")

local SHOW_AVATAR = PlayerNameplates:GetCustomProperty("ShowAvatar")
local SHOW_HEALTH = PlayerNameplates:GetCustomProperty("ShowHealth")
local SHOW_ICONS = PlayerNameplates:GetCustomProperty("ShowIcons")
local SHOW_ON_SELF = PlayerNameplates:GetCustomProperty("ShowOnSelf")
local SHOW_ON_NEUTRALS = PlayerNameplates:GetCustomProperty("ShowOnNeutrals")
local SHOW_ON_FRIENDLIES = PlayerNameplates:GetCustomProperty("ShowOnFriendlies")
local SHOW_ON_ENEMIES = PlayerNameplates:GetCustomProperty("ShowOnEnemies")

local NEUTRAL_HEALTH_COLOR = PlayerNameplates:GetCustomProperty("NeutralHealthColor")
local FRIENDLY_HEALTH_COLOR = PlayerNameplates:GetCustomProperty("FriendlyHealthColor")
local ENEMY_HEALTH_COLOR = PlayerNameplates:GetCustomProperty("EnemyHealthColor")

local SHOW_PARTY_COLOR = PlayerNameplates:GetCustomProperty("ShowPartyColor")
local PARTY_MEMBER_COLOR = PlayerNameplates:GetCustomProperty("PartyMemberColor")
local PARTY_LEADER_COLOR = PlayerNameplates:GetCustomProperty("PartyLeaderColor")

local SHOW_TITLE_PREFIX = PlayerNameplates:GetCustomProperty("ShowTitlePrefix")

local PLAYER_NAME_COLOR_MODES = { "STATIC", "TEAM", "TITLE" }

local COLOR_DEFAULT = Color.New(1, 1, 1, 1)

local DATA_HANDLER = PlayerNameplates:GetCustomProperty("DataHandler"):WaitForObject()

------------------------------------------------------------------------------------------------------------------------
--	INITIAL VARIABLES
------------------------------------------------------------------------------------------------------------------------
local nameplates = {}
local nameplatesResolution = {}
local nameplatesIcons = {}
local playerTeams = {}
local playerHealth = {}
local playerMaxHealth = {}
local playersDead = {}

------------------------------------------------------------------------------------------------------------------------
--	LOCAL FUNCTIONS
------------------------------------------------------------------------------------------------------------------------

-- value interpolation over time with c as the difference parameter adjustable with delta time
local function Approach(a, b, c, dt)
	if dt then c = c * (dt*60) end
	if a < b then a = a + c end
	if a > b then a = a - c end
	return a
end

--	Player FindPlayerByName(string)
--	Finds a player in all players by string name
local function FindPlayerByName(playerName)
	for _, player in pairs(Game.GetPlayers()) do
		if(player.name == playerName) then
			return player
		end
	end
end

local function WaitFor(object)
	while object == nil do
		Task.Wait(1)
	end
end

local function SetIcon(player, number, assetId)
	WaitFor(nameplatesIcons[player])
	-- test
	if player == nil then error("Player is nil.") end
	if assetId ~= nil then if assetId ~= "#" then if type(assetId) ~= "string" then error("Argument imageId must be a string or nil.") end end end
	if type(number) ~= "number" then error("Argument number must be a number.") end
	number = #nameplatesIcons[player] - number + 1 -- convert number from 1->cap to cap<-1
	if not nameplatesIcons[player][number] then error("Icon number (" .. tostring(number) .. ") outside of range.") end
	-- set
	nameplatesIcons[player][number]:SetColor(Color.WHITE)
	if assetId == nil then
		nameplatesIcons[player][number].parent.visibility = Visibility.FORCE_OFF
	elseif assetId == "#" then
		nameplatesIcons[player][number]:SetImage(clampIcon)
		nameplatesIcons[player][number].rotationAngle = 90
		nameplatesIcons[player][number].width = 20
		nameplatesIcons[player][number].height = 80
		nameplatesIcons[player][number].parent.visibility = Visibility.INHERIT
		nameplatesIcons[player][number].visibility = Visibility.INHERIT
	else
		nameplatesIcons[player][number]:SetImage(assetId)
		nameplatesIcons[player][number].rotationAngle = 0
		nameplatesIcons[player][number].width = 100
		nameplatesIcons[player][number].height = 100
		nameplatesIcons[player][number].parent.visibility = Visibility.INHERIT
		nameplatesIcons[player][number].visibility = Visibility.INHERIT
	end
end

local function SetIconColor(player, number, color)
	WaitFor(nameplatesIcons[player])
	if player == nil then error("Player is nil.") end
	if type(number) ~= "number" then error("Argument number must be a number.") end
	number = #nameplatesIcons[player] - number + 1 -- convert number from range 1->cap to cap<-1
	nameplatesIcons[player][number]:SetColor(color)
end

--	nil OnPlayerJoined(Player)
--	Creates a nameplate for a player
local function OnPlayerJoined(player)
	playerTeams[player] = player.team
	playerHealth[player] = player.hitPoints
	playerMaxHealth[player] = player.maxHitPoints
	playersDead[player] = player.isDead

	local title = PlayerTitles.GetPlayerTitle(player)

	local nameplate = World.SpawnAsset(NameplateTemplate)
	nameplate.name = player.name
	nameplates[player] = nameplate
	nameplatesResolution = nameplate:FindChildByType("UIContainer"):GetCanvasSize()

	local nameText, titleText, avatar, healthText, healthBar, healthBarOutline, playerIcons =
		nameplate:GetCustomProperty("Name"):WaitForObject(),
		nameplate:GetCustomProperty("Prefix"):WaitForObject(),
		nameplate:GetCustomProperty("Avatar"):WaitForObject(),
		nameplate:GetCustomProperty("HealthTextValue"):WaitForObject(),
		nameplate:GetCustomProperty("HealthBarValue"):WaitForObject(),
		nameplate:GetCustomProperty("Healthbar"):WaitForObject(),
		nameplate:FindDescendantsByName("Icon")

	nameplatesIcons[player] = playerIcons

	avatar:SetPlayerProfile(player)
	avatar.visibility = Visibility.INHERIT

	local teamColor = PlayerTitles.GetPlayerTeamColor(LocalPlayer, player, NEUTRAL_HEALTH_COLOR, FRIENDLY_HEALTH_COLOR, ENEMY_HEALTH_COLOR)
	healthBar:SetColor(teamColor)

	nameText.text = player.name

	if(PLAYER_NAME_COLOR_MODE == "TEAM") then
		nameText:SetColor(teamColor)
	elseif(title and (PLAYER_NAME_COLOR_MODE == "TITLE")) then
		nameText:SetColor(title.prefixColor or COLOR_DEFAULT)
	else
		nameText:SetColor(PLAYER_NAME_COLOR)
	end

	do
		if SHOW_PARTY_COLOR then
			local color = nameText:GetColor()
			local partyColor = PlayerTitles.GetPlayerPartyColor(LocalPlayer, player, color, PARTY_MEMBER_COLOR, PARTY_LEADER_COLOR)
			if (PLAYER_NAME_COLOR_MODE ~= "STATIC") then
				-- shift color towards party colors
				local v
				local shift = 0.75
				v = (color.r < partyColor.r) and 1 or -1
				color.r = color.r + v*math.abs(color.r-partyColor.r)*shift
				v = (color.g < partyColor.g) and 1 or -1
				color.g = color.g + v*math.abs(color.g-partyColor.g)*shift
				v = (color.b < partyColor.b) and 1 or -1
				color.b = color.b + v*math.abs(color.b-partyColor.b)*shift
				nameText:SetColor(color)
			else
				-- replace color with party color
				nameText:SetColor(partyColor)
			end
		end
	end

	if(SHOW_HEALTH) then
		healthText.text =  string.format("%d / %d", player.hitPoints, player.maxHitPoints)
	else
		healthText.visibility = Visibility.FORCE_OFF
		healthBar.visibility = Visibility.FORCE_OFF
		healthBarOutline.visibility = Visibility.FORCE_OFF
	end

	if(SHOW_TITLE_PREFIX and title) then
		titleText.text = title.prefix or ""
		titleText:SetColor(title.prefixColor or Color.New(0.1, 0.1, 0.1))
		titleText.visibility = Visibility.INHERIT
	else
		titleText.visibility = Visibility.FORCE_OFF
	end

	local socketPosition = World.SpawnAsset(SocketPositionTemplate)
	socketPosition:AttachToPlayer(player, "nameplate")
	nameplate:Follow(socketPosition)

	if (not SHOW_ICONS) then
		for i = 1, #playerIcons do
			playerIcons[i].parent.visibility = Visibility.FORCE_OFF
		end
	end

	if (not SHOW_AVATAR) then
		avatar.parent.visibility = Visibility.FORCE_OFF
		for i = 1, #playerIcons do
			playerIcons[i].parent.x = playerIcons[i].parent.x - avatar.width - 20 - 20
		end
		healthBarOutline.width = healthBarOutline.width + avatar.width + 20 + 20
	end

	if(not SHOW_HEALTH) then
		if (SHOW_ICONS) then
			for i = 1, #playerIcons do
				playerIcons[i].parent.y = playerIcons[i].parent.y - healthBarOutline.height - 20
			end
		else
			nameText.y = nameText.y + avatar.height - 20 - 40
			titleText.y = titleText.y + avatar.height + 200
			titleText.shouldWrapText = false
			if (SHOW_AVATAR) then
				nameText.x = nameText.x + avatar.width + 20 + 20
				titleText.x = titleText.x + avatar.width + 20 + 20
			else
				nameText.x = 0
				nameText.anchor = UIPivot.BOTTOM_CENTER
				nameText.dock = UIPivot.BOTTOM_CENTER
				titleText.x = 0
				titleText.anchor = UIPivot.BOTTOM_CENTER
				titleText.dock = UIPivot.BOTTOM_CENTER
				titleText.justification = TextJustify.CENTER
				nameText.justification = TextJustify.CENTER
			end
		end
	end

	PlayerTitles.SetVisibility(LocalPlayer, player, nameplate, SHOW_ON_SELF, SHOW_ON_NEUTRALS, SHOW_ON_FRIENDLIES, SHOW_ON_ENEMIES)
end

--	nil OnPlayerLeft(Player)
--	Destroys a player's nameplate
local function OnPlayerLeft(player)
	playerTeams[player] = nil
	playerHealth[player] = nil
	playerMaxHealth[player] = nil
	playersDead[player] = nil

	local nameplate = nameplates[player]
	if(not nameplate) then return end
	if(not Object.IsValid(nameplate)) then return end

	nameplate:Destroy()
	nameplates[player] = nil
	nameplatesIcons[player] = nil
end

--	nil UpdatePlayerNameColor(Player, CoreObject)
--	Sets the name color for a player's nameplate
local function UpdatePlayerNameColor(player, nameplate)
	if(not Object.IsValid(nameplate)) then return end

	local playerNameText = nameplate:GetCustomProperty("Name"):WaitForObject()

	local teamColor = PlayerTitles.GetPlayerTeamColor(LocalPlayer, player, NEUTRAL_HEALTH_COLOR, FRIENDLY_HEALTH_COLOR, ENEMY_HEALTH_COLOR)
	local title = PlayerTitles.GetPlayerTitle(player)

	if(PLAYER_NAME_COLOR_MODE == "TEAM") then
		playerNameText:SetColor(teamColor)
	elseif(title and (PLAYER_NAME_COLOR_MODE == "TITLE")) then
		playerNameText:SetColor(title.prefixColor or COLOR_DEFAULT)
	else
		playerNameText:SetColor(PLAYER_NAME_COLOR)
	end

	do
		if SHOW_PARTY_COLOR then
			local color = playerNameText:GetColor()
			local partyColor = PlayerTitles.GetPlayerPartyColor(LocalPlayer, player, color, PARTY_MEMBER_COLOR, PARTY_LEADER_COLOR)
			if (PLAYER_NAME_COLOR_MODE ~= "STATIC") then
				-- shift color towards party colors
				local v
				local shift = 0.65
				v = (color.r < partyColor.r) and 1 or -1
				color.r = color.r + v*math.abs(color.r-partyColor.r)*shift
				v = (color.g < partyColor.g) and 1 or -1
				color.g = color.g + v*math.abs(color.g-partyColor.g)*shift
				v = (color.b < partyColor.b) and 1 or -1
				color.b = color.b + v*math.abs(color.b-partyColor.b)*shift
				playerNameText:SetColor(color)
			else
				-- replace color with party color
				playerNameText:SetColor(partyColor)
			end
		end
	end
end

--	nil UpdateHealth(Player, CoreObject)
--	Sets the health for a player's nameplate
local function UpdateHealth(player, nameplate)
	if(not Object.IsValid(nameplate)) then return end

	local nameplateHealth = nameplate:GetCustomProperty("HealthTextValue"):WaitForObject()
	nameplateHealth.text = string.format("%d / %d", player.hitPoints or 0, player.maxHitPoints)
	nameplateHealth = nameplate:GetCustomProperty("HealthBarValue"):WaitForObject()
	local maxSize = nameplatesResolution.x + nameplateHealth.parent.width - 20
	nameplateHealth.width = -20 - math.floor(((1 - (player.hitPoints or 0) / player.maxHitPoints)) * maxSize)
end

--	nil UpdateHealthColor(Player, CoreObject)
--	Sets the health color for a player's nameplate
local function UpdateHealthColor(player, nameplate)
	if(not Object.IsValid(nameplate)) then return end

	local nameplateHealthBar = nameplate:GetCustomProperty("HealthBarValue"):WaitForObject()
	local teamColor = PlayerTitles.GetPlayerTeamColor(LocalPlayer, player, NEUTRAL_HEALTH_COLOR, FRIENDLY_HEALTH_COLOR, ENEMY_HEALTH_COLOR)
	nameplateHealthBar:SetColor(teamColor)
end

--	nil UpdateVisibility(Player, CoreObject)
--	Sets the visibility of a player's nameplate
local function UpdateVisibility(player, nameplate)
	if(not Object.IsValid(nameplate)) then return end

	PlayerTitles.SetVisibility(LocalPlayer, player, nameplate, SHOW_ON_SELF, SHOW_ON_NEUTRALS, SHOW_ON_FRIENDLIES, SHOW_ON_ENEMIES)
end

--	nil RotateNameplate(CoreObject)
--	Rotates a nameplate locally to face the player
local function RotateNameplate(nameplate)
	if(not Object.IsValid(nameplate)) then return end

	local quaternion = Quaternion.New(LocalPlayer:GetViewWorldRotation())
	quaternion = quaternion * Quaternion.New(Vector3.UP, 180)
	nameplate:SetWorldRotation(Rotation.New(quaternion))
end

local voiceChatTimer = 0
local function UpdateVoiceChatVolume(player, nameplate, dt)
	if (player == nil) then return end
	if(not Object.IsValid(nameplate)) then return end
	-- timer
	if VoiceChat.IsPlayerSpeaking(player) then
		voiceChatTimer = 2
	end

	local nameplateVoice = nameplate:GetCustomProperty("VoiceChat"):WaitForObject()
	if voiceChatTimer > 0 then
		nameplateVoice.visibility = Visibility.INHERIT
		local nameplateVolume = nameplate:GetCustomProperty("VoiceChatVolume"):WaitForObject()
		local v = nameplateVolume.width * VoiceChat.GetPlayerSpeakingVolume(player)
		nameplateVolume.height = math.floor(Approach(nameplateVolume.height, v, math.abs(nameplateVolume.height - v)/5, dt))
		voiceChatTimer = voiceChatTimer - dt
	else
		nameplateVoice.visibility = Visibility.FORCE_OFF
	end
end

--	nil Update(CoreObject)
--	Updates Rotation, Health, HealthColor, NameColor, and Visibility of a nameplate
local function Update(nameplate, dt)
	if(not Object.IsValid(nameplate)) then return end

	RotateNameplate(nameplate)

	local player = FindPlayerByName(nameplate.name)
	if(not player) then return end

	local dead = player.isDead
	if(dead and (not playersDead[player])) then -- died
		playersDead[player] = dead
		UpdateHealth(player, nameplate, 0)
	elseif((not dead) and playersDead[player]) then -- respawned
		playersDead[player] = dead
		UpdateHealth(player, nameplate, player.hitPoints)
	elseif((playerHealth[player] ~= nil) and (player.hitPoints ~= playerHealth[player])) then
		UpdateHealth(player, nameplate)
	end
	if((playerMaxHealth[player] ~= nil) and (player.maxHitPoints ~= playerMaxHealth[player])) then
		UpdateHealth(player, nameplate)
	end
	--if((playerTeams[player] ~= nil) and (player.team ~= playerTeams[player])) then
		UpdatePlayerNameColor(player, nameplate)
		UpdateHealthColor(player, nameplate)
		UpdateVisibility(player, nameplate)
		UpdateVoiceChatVolume(player, nameplate, dt)
	--end

	local data = DATA_HANDLER:FindChildByName(tostring(player.id))
	if data then
		-- icons
		local iconData = data:GetCustomProperty("Icons")
		local count = #nameplatesIcons[player]
		local i = 0
		local keys = {}
		for key in string.gmatch(iconData, "[^%:]+") do
			i = i + 1
			keys[i] = key
		end
		for i = 1, count do
			local key = keys[i]
			if key ~= "#" then -- ellipsis
				if key ~= nil then -- disable
					if not IconAssets[key] then warn("This icon (" .. tostring(key) .. ") doesn't have a corresponding icon asset! Add it in the Nameplate Icon Assets module.") end
				end
				SetIcon(player, i, IconAssets[key] and IconAssets[key].image or nil)
			else
				SetIcon(player, i, key)
			end
			SetIconColor(player, i, IconAssets[key] and IconAssets[key].color or Color.WHITE)
		end
		-- titles
		local defaultTitle = PlayerTitles.GetPlayerTitle(player)
		local title = data:GetCustomProperty("Title")
		local titleColor = data:GetCustomProperty("TitleColor")
		local titleObject = nameplate:GetCustomProperty("Prefix"):WaitForObject()
		titleColor = (title == "") and (defaultTitle and defaultTitle.prefixColor) or titleColor
		if(SHOW_TITLE_PREFIX) then
			if (title ~= "") or (defaultTitle and defaultTitle.prefix) then
				titleObject.visibility = Visibility.INHERIT
			else
				titleObject.visibility = Visibility.FORCE_OFF
			end
		else
			titleObject.visibility = Visibility.FORCE_OFF
		end
		title = (title == "") and (defaultTitle and defaultTitle.prefix) or title
		titleObject.text = title
		titleObject:SetColor(titleColor)
	end
end

--	string GetProperty(string, table)
--	Returns a value (string) based on a table of default options (strings)
local function GetProperty(value, options)
	value = string.upper(value)

	for _, option in pairs(options) do
		if(value == option) then return value end
	end

	return options[1]
end

------------------------------------------------------------------------------------------------------------------------
--	GLOBAL FUNCTIONS
------------------------------------------------------------------------------------------------------------------------

--	nil Tick(deltaTime)
--	Updates all nameplates every frame
function Tick(dt)
	for _, nameplate in pairs(nameplates) do
		if(Object.IsValid(nameplate)) then
			Update(nameplate, dt)
		end
	end
end

------------------------------------------------------------------------------------------------------------------------
--	INITIALIZATIONS
------------------------------------------------------------------------------------------------------------------------

Game.playerJoinedEvent:Connect(OnPlayerJoined)
Game.playerLeftEvent:Connect(OnPlayerLeft)

PLAYER_NAME_COLOR_MODE = GetProperty(PLAYER_NAME_COLOR_MODE, PLAYER_NAME_COLOR_MODES)