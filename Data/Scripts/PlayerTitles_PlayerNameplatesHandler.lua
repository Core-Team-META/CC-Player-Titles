local nameplateTemplate = script:GetCustomProperty("PlayerNameplate")
local clampIcon = script:GetCustomProperty("ClampIcon")

local iconList = {}

local iconCount = 0
do
	local nameplate = World.SpawnAsset(nameplateTemplate)
	iconCount = #nameplate:FindDescendantsByName("Icon Frame")
	nameplate:Destroy()
end

local needToUpdate = false

-- event queue
local QUEUE_DELAY = 0.25
local queueWait = 0
local queue = {}

local function Info(message)
	print("PlayerTitles (PlayerNameplates)-" .. (Environment.IsClient() and "Client" or "Server") .. " | " .. message)
end

-- adds events to the queue
local function QueueAdd(name, data1, data2, data3)
	queue[#queue+1] = {event = name, data1 = data1, data2 = data2, data3 = data3}
end

-- processes and sends events from the queue
local function QueueProcess(dt)
	if #queue > 0 then
		if queueWait <= 0 then
			local result = Events.BroadcastToAllPlayers(queue[1].event, queue[1].data1, queue[1].data2, queue[1].data3)
			local retry = false -- on fail
			if result ~= BroadcastEventResultCode.SUCCESS then
				queueWait = QUEUE_DELAY
				if result ~= BroadcastEventResultCode.EXCEEDED_RATE_WARNING_LIMIT then
					retry = true
					Info("(" .. queue[1].event .. ") Retrying in " .. tostring(queueWait) .. " s.")
				else
					queueWait = QUEUE_DELAY*2
				end
			end
			-- on success
			if not retry then
				table.remove(queue, 1)
			end
		else
			queueWait = queueWait - dt
		end
	end
end

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
				list[p][i] = {assetId = v.assetId, color = v.color}
			end
		end
		if i > iconCount then
			list[p][8].assetId = -7
			list[p][iconCount].color = nil
		end
	end
	for i = 1, iconCount do
		for p, _ in pairs(list) do
			-- test delta.
			-- this pass checks if theres anything thats changed in this slot.
			-- this is to avoid sending unnecessary networked broadcasts.
			local delta = false
			local deltaIcon = false
			local deltaColor = false
			local current = list[p][i]
			local old = lastList[p] and lastList[p][i]
			if (old == nil or current == nil) and old ~= current then
				delta = true
				deltaIcon = true
				deltaColor = true
			end
			if not delta then
				if old and current then
					if old.assetId ~= current.assetId then delta = true deltaIcon = true end
					if old.color ~= current.color then delta = true deltaColor = true end
				end
			end
			-- broadcast if delta passed
			if delta == true then
				if deltaIcon == true then 
					QueueAdd("PlayerTitles_setIconEvent", p, i, list[p][i] and list[p][i].assetId)
				end
				if list[p][i] then
					if list[p][i].color then
						if deltaColor == true then 
							QueueAdd("PlayerTitles_setIconColorEvent", p, i, list[p][i].color)
						end
					end
				end
			end
		end
	end
	needToUpdate = false
	lastList = list
	list = nil
end

_G.PlayerTitles = {}
_G.PlayerTitles.AddIcon = (
	function(player, assetId, color, duration)
		-- get unique id
		local id
		repeat
			id = math.random()
		until iconList[player][id] == nil
		-- add to list and return id
		iconList[player][id] = {assetId = assetId, color = color, duration = tonumber(duration)}
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

function Tick(dt)
	QueueProcess(dt)
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

local function OnPlayerJoined(player)
	iconList[player] = {}
	-- FOR TESTING \/
	-- spawns 5000 icons for networking load testing
	for i = 1, 5000 do
		_G.PlayerTitles.AddIcon(player, clampIcon, Color.New(math.random(), math.random(), math.random()), math.random()*8)
	end
end
Game.playerJoinedEvent:Connect(OnPlayerJoined)