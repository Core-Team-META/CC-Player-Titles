--[[
	Player Titles - README
	1.0.9 - 2021/7/27
	Contributors:
		Nicholas Foreman (META) (https://www.coregames.com/user/f9df3457225741c89209f6d484d0eba8)
		Chipnertkj (https://www.coregames.com/user/aabffd57e2814ff1bc7f80f5fd32b5a4)

	Player Titles allows game creators to give special roles to themselves, dedicated players, and anyone they deem fit
	for recognition. With a simple module it's easy to dictate and customize a hierarchy of roles. A set of user interface
	components shows this special recognition for everyone: playerlist, scoreboard, and nameplate.

1.	Setup:
		1)	Edit the PlayerTitles module (Project Content > Imported Content > Player Titles > PlayerTitles) to include you
			and anyone else you want to give special titles to.
		2)	Insert the player MUIDs into the tables; documentation is provided in the script.
		3)	Drag and drop either a "PlayerList", "PlayerNameplates", or "Scoreboard" into the hierarchy (or all three!)
		4)	Alter custom properties as you wish!

2.	Usage:
		Simply edit the PlayerTitles module to include yourself as a game creator (instructions provided) and drag-and-drop
		any of the templates (PlayerList, PlayerNameplates, Scoreboard) into the hierarchy.

3.	PlayerTitles:
		This contains all of the possible social titles and their respective assignments. More documentation can be found in
		the script itself.

3b.	PlayerList:
		A "PlayerList" is a compact UI panel listing players and their corresponding teams and titles.

3c.	Player Nameplates:
		A "PlayerNameplate" is text above a player's head indicating their username, health, titles and icons.
		Icons can be defined in the NameplateIconAssets script, and used through API functions defined in section 5.

3d.	Scoreboard:
		A "Scoreboard" is a large UI panel listing players and their corresponding teams and titles alongside additional
		stats, such as kills, deaths, or even resources.

4.	Discord:
		If you have any questions, feel free to join the Core Hub Discord server:
			discord.gg/core-creators
		We are a friendly group of creators and players interested in the games and community on Core. Open to everyone,
		regardless of your level of experience or interests.

5.	(Advanced) API functions:
		These functions can be accessed and called from the PlayerTitles table in _G (an environment specific table (separate for every client and the server))
		like this:
			_G.PlayerTitles.FunctionNameGoesHere()

		[server] AddIcon (Player player, string iconAssetId, [number duration])
			Creates an icon on a player's nameplate that will be replicated across all clients.
			The iconAssetId parameter is one of the icon asset names defined in NameplateIconAssets. This icon asset will be used for the new icon.
			The duration parameter is optional and defines the time in seconds before the icon automatically disappears.
			Returns a string containing the id of the icon (not icon asset) for use with RemoveIcon.

		[server] RemoveIcon (Player player, string id)
			Removes an icon previously created with AddIcon.
			Parameter id is the string icon id returned from AddIcon.
--]]