--[[

	Nameplate Icon Assets - Module
	1.0.9 - 2021/7/27
	Contributors
		Nicholas Foreman (META) (https://www.coregames.com/user/f9df3457225741c89209f6d484d0eba8)
		Chipnertkj (https://www.coregames.com/user/aabffd57e2814ff1bc7f80f5fd32b5a4)

	Adding an Icon Asset

	1)	Select this module in Project Content
	2)	Search Core Content for your icon of choice
	3)	Drag and drop that icon into the custom properties of this module
	4)	Change its name to something that identifies it. This will be the name of this icon asset in code.
	5)	Create your icon asset using the AddIconAsset function. Put your code in the designated assets section below.
		An example of an icon asset has been attached there as a comment.
--]]

local Module = {}

-- void AddIconAsset(string name, Color color = Color.WHITE)
local function AddIconAsset(name, color)
	color = color or Color.WHITE
	local image = script:GetCustomProperty(name)
	if not image then error("Image for icon asset \"" .. tostring(name) .. "\" not found. Check the Nameplate Icon Assets module for instructions.") end
	Module[name] = {image = image, color = color}
end

do	-- \/ your assets go here

	--	example:
	--	(after adding a property "debuff1" (asset reference (brush)) to the script)
	--		AddIconAsset("debuff1", Color.New(1, 0, 0))

	AddIconAsset("Abc", Color.GREEN)
	AddIconAsset("Bca", Color.RED)
	AddIconAsset("Cab", Color.BLUE)

end	-- /\ your assets go here
return Module