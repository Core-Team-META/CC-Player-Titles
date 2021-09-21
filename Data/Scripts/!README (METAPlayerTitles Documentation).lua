--[[
	Player Titles - Documentation
	
	Contributors:
		Chipnertkj [https://www.coregames.com/user/aabffd57e2814ff1bc7f80f5fd32b5a4]
		Nicholas Foreman [https://www.coregames.com/user/f9df3457225741c89209f6d484d0eba8]
]]

--[[
	Player Titles allows game creators to give special roles to themselves, dedicated players, and anyone they deem fit for recognition.
	With a simple module it's easy to dictate and customize a hierarchy of roles.
	A set of user interface components shows this special recognition for everyone: Nameplates, List and Scoreboard.

	Table of contents:
		1. Setup
			1.1. Basic setup
			1.2. API setup
		2. Components
			2.1. Configurator
			2.2. Config Module
			2.3. Nameplates
			2.4. List
			2.5. Scoreboard
			2.6. Handler
		3. Contributing
]]

--[[
	------------------------------------------------------------------------------------------------------------------------
	1.	Setup
	------------------------------------------------------------------------------------------------------------------------
	1.1. Basic setup
		The basic setup process is very simple:
		1. Drag all of the component templates that you need (Nameplates, List and/or Scoreboard) into the hierarchy.
		2. Drag in the Handler template supplied with this package.
		3. Drag in the Configurator template supplied with this package, or create one in your hierarchy.
		4. Drag your Configurator (from your hierarchy) into the "Configurator" custom properties of the rest of the components, including the Handler.
		5. Drag your Handler into the custom property in the "Handler" folder inside of your Configurator.
		6. Modify the Configurator (its custom properties and/or entries) to fit your needs. You can deinstance it if you need or want to add new entries.

	1.2. API setup
]]