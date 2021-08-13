if not _G.PlayerTitles then _G.PlayerTitles = {} end
_G.PlayerTitles.iconCount = 0
do
	local nameplateTemplate = script:GetCustomProperty("PlayerNameplate")
	local nameplate = World.SpawnAsset(nameplateTemplate)
	_G.PlayerTitles.iconCount = #nameplate:FindDescendantsByName("Icon Frame")
	nameplate:Destroy()
end