local templatePlayerNameplateData = script:GetCustomProperty("PlayerNameplateData")
local nameplateData = {}
local iconList = {}
local customTitles = {}

local iconCount = nil

local needToUpdate = false

local lastList = nil
local function UpdateIcons()
	-- new last list
	if lastList == nil then
		lastList = {}
		local p = Game.GetPlayers()
		for i = 1, #p do
			lastList[p] = {}
		end
	end
	-- new list
	local list = 0
	list = {}
	for p, _ in pairs(iconList) do
		list[p] = {}
		local i = 0
		for k, v in pairs(iconList[p]) do
			i = i + 1
			if i <= iconCount then
				list[p][i] = {iconAssetId = v.iconAssetId}
			end
		end
		if i > iconCount then
			list[p][8].iconAssetId = "#"
		end
	end
	for p, _ in pairs(list) do
		-- test delta
		local delta = false
		for i = 1, iconCount do
			-- this pass checks if theres anything thats changed in this slot.
			-- this is to avoid sending unnecessary networked broadcasts.
			local current = list[p][i]
			local old = lastList[p] and lastList[p][i]
			if (old == nil or current == nil) and old ~= current then delta = true end
			if not delta then
				if old and current then
					if old.iconAssetId ~= current.iconAssetId then delta = true end
				end
			end
			if delta then break end
		end
		-- broadcast if delta passed
		if delta then
			local data = nameplateData[p]:GetCustomProperty("Icons")
			local keys = {}
			local i = 0
			for key in string.gmatch(data, "[^%:]+") do
				i = i + 1
				keys[i] = key
			end
			local s = ""
			for i = 1, iconCount do
				local current = list[p][i]
				keys[i] = current and (current.iconAssetId or "") or ""
				s = s .. tostring(keys[i]) .. ":"
			end
			nameplateData[p]:SetNetworkedCustomProperty("Icons", string.sub(s, 1, string.len(s)-1))
		end
	end
	needToUpdate = false
	lastList = list
	list = nil
end

local function UpdateTitle(player)
	local data = nameplateData[player]
	if data then
		if data:GetCustomProperty("Title") ~= (customTitles[player] and customTitles[player].title or "") then
			data:SetNetworkedCustomProperty("Title", (customTitles[player] and customTitles[player].title or ""))
		end
		if data:GetCustomProperty("TitleColor") ~= (customTitles[player] and customTitles[player].color or Color.WHITE) then
			data:SetNetworkedCustomProperty("TitleColor", (customTitles[player] and customTitles[player].color or Color.WHITE))
		end
	end
end

if not _G.PlayerTitles then _G.PlayerTitles = {} end

_G.PlayerTitles.AddIcon = (
	function(player, iconAssetId, duration)
		-- get unique id
		local id
		repeat
			id = math.random()
		until iconList[player][id] == nil
		-- add to list and return id
		iconList[player][id] = {iconAssetId = iconAssetId, duration = tonumber(duration)}
		needToUpdate = true
		return id
	end
)
_G.PlayerTitles.RemoveIcon = (
	function(player, id)
		if not id then return nil end
		-- add to list and return id
		local r = iconList[player][id]
		iconList[player][id] = nil
		needToUpdate = true
		return r
	end
)

_G.PlayerTitles.SetTitle = (
	function(player, title, color)
		customTitles[player] = {title = (title or ""), color = (color or Color.WHITE)}
		UpdateTitle(player)
	end
)
_G.PlayerTitles.ResetTitle = (
	function(player)
		customTitles[player] = nil
		UpdateTitle(player)
	end
)

local function LoadIconCount()
	while iconCount == nil do
		if _G.PlayerTitles then
			iconCount = _G.PlayerTitles.iconCount
		end
		Task.Wait(0.2)
	end
end

local function OnPlayerJoined(player)
	nameplateData[player] = World.SpawnAsset(templatePlayerNameplateData, {parent = script.parent})
	LoadIconCount()
	local s = ""
	for i = 1, iconCount-1 do
		s = s .. ":"
	end
	nameplateData[player]:SetNetworkedCustomProperty("Icons", s)
	nameplateData[player].name = tostring(player.id)
	iconList[player] = {}

	_G.PlayerTitles.SetTitle(player, "Test title", Color.GREEN)
	Task.Wait(1)
	_G.PlayerTitles.ResetTitle(player)

	-- spawns (count) icons with durations in range 0 to (length) seconds for networking tests
	do -- test
		local count = 50
		local length = 10
		for i = 1, count do
			_G.PlayerTitles.AddIcon(player, i%5 ~= 0 and (i%2 == 0 and "ShieldEffect" or "BowEffect") or "PoisonEffect", length*i/count)
		end
	end
end
Game.playerJoinedEvent:Connect(OnPlayerJoined)

function Tick(dt)
	for p, _ in pairs(iconList) do
		for k, v in pairs(iconList[p]) do
			if v.duration then
				if v.duration > 0 then
					v.duration = v.duration - dt
				end -- no else here on purpose
				if v.duration <= 0 then
					_G.PlayerTitles.RemoveIcon(p, k)
				end
			end
		end
	end

	if needToUpdate then
		UpdateIcons()
	end
end