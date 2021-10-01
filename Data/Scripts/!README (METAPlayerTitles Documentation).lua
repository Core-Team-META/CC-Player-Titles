--[[
	Player Titles - Documentation

	Contributors:
		Chipnertkj [https://www.coregames.com/user/aabffd57e2814ff1bc7f80f5fd32b5a4]
		Nicholas Foreman [https://www.coregames.com/user/f9df3457225741c89209f6d484d0eba8]

	------------------------------------------------------------------------------------------------------------------------
	Intro
	------------------------------------------------------------------------------------------------------------------------
	Player Titles allows game creators to give special roles to themselves, dedicated players, and anyone they deem fit for recognition.
	With a simple module it's easy to dictate and customize a hierarchy of roles.
	A set of user interface components shows this special recognition for everyone: Nameplates, List and Scoreboard.

	Table of contents:
		1. Setup
			1.1. Basic setup
			1.2. API setup (OPTIONAL)
				1.2.1. Using _G
				1.2.2. Using the Configurator Reader
		2. General Info
			2.1. Config Module
			2.2. Configurator
			2.3. Titles
			2.4. Icons
			2.5. API Documentation
		3. Components
			3.1. Nameplates
			3.2. List
			3.3. Scoreboard
			3.4. Handler
		4. Contributing

	Clarification: The names of the templates in project content referenced throughout this document will usually be prefixed with "METAPlayerTitles_",
	while here the prefix will be skipped for readability purposes.

	------------------------------------------------------------------------------------------------------------------------
	1.	Setup
	------------------------------------------------------------------------------------------------------------------------
	1.1. Basic setup
		The basic setup process is relatively simple:
			1. Drag all of the component templates that you need (Nameplates, List and/or Scoreboard) into the hierarchy.
			2. Drag in the Handler template supplied with this package.
			3. Drag in the Configurator template supplied with this package, or create one in your hierarchy.
			4. Drag your Configurator (from your hierarchy) into the "Configurator" custom properties of the rest of the components, including the Handler.
			5. Drag your Handler into the custom property in the "Handler" folder inside of your Configurator.
			6. Modify the Configurator (its custom properties and/or entries) to fit your needs. You can deinstance it if you need or want to add new entries.

	1.2. API setup (OPTIONAL)
		To take advantage of the full feature set of Player Titles, you'll need to be able to access its API functions.
		If you want to read from, modify or otherwise use the Config module (which contains all of the config data and utility functions
		that are shared between scripts in a context), you can access it in 2 different ways:
			1.2.1. Using _G:
				_G.METAPlayerTitles is a table in _G (shared between scripts in a context) which holds some of the internal variables used in Player Titles.
				That includes _G.METAPlayerTitles.Config. You can read from this to get the reference to the Config table, but only after one of the components
				initializes it. Before that it will just be nil, or the _G.METAPlayerTitles table won't exist at all. Be sure to account for that.

			1.2.2. Using the Configurator Reader:
				All Player Titles components use (require) a ConfiguratorReader script, that sets the Config module up and caches it in _G.METAPlayerTitles.Config,
				so that it can return the cached module instead of generating a copy on future calls. The way this is set up on each component is as follows:

					The root folder of the component has a Core Reference custom property, which should point to the Configurator instance that will be used to
					generate the Config module. The main script of the component stores a reference to both the ConfiguratorReader script and the root folder.
					The root folder is read from the property by the script and saved to a local variable, named rootFolder.
					At the end, this chunk of code is pasted in:

							------------------------------------------------------------------------------------------------------------------------
							--	Config
							------------------------------------------------------------------------------------------------------------------------
							if _G.METAPlayerTitles == nil then
								_G.METAPlayerTitles = {configurator = assert(rootFolder:GetCustomProperty("Configurator"):GetObject(), "Configurator not found.")}
							end
							local Config = require(script:GetCustomProperty("ConfiguratorReader"))

					This ensures that the module is generated and returned properly, regardless of the other components and their state.

				If you're struggling with this part, you might want to take a look at how it's done in the Player Titles components.

	------------------------------------------------------------------------------------------------------------------------
	2.	General Info
	------------------------------------------------------------------------------------------------------------------------
	2.1. Config Module
		The Config module is a lua module containing all of the config data and utility functions that are meant to be shared between Player Titles
		component scripts in a context. (Every context has a separate Config module.)
		It can be accessed through code using the methods described in 1.2.
		The Config module is documented in the ConfiguratorReader script. Be sure to check it out if you're planning to use Player Titles to its fullest.

	2.2. Configurator
		The Configurator is a folder structure containing a variety of custom properties that can be modified to alter the state of the Config module on its generation.
		The data from the module is then use to initialize all of the components. As such, the Configurator is used to directly configure Player Titles components
		on startup.

		You can find an example Configurator template attached with Player Titles. You don't have to use it, you can create your own Configurator,
		or just modify the template to fit your needs.

		Here's its overall structure with custom properties, for reference.
		Custom Property usage and definitions are described in their respective property tooltips in the editor.
			Legend:
				[F] - folder
				[P] - custom property
				[E] - entries, multiple instances of the specified template
				(String, Color Mode) - either STATIC, TEAM or TITLE.
					Color Modes are the way Player Titles handles configurable, dynamic colors for UI components. A Color Mode is just an enum.
					STATIC makes the component use a static color, TEAM - the player's team relation color, TITLE - the player's title's color.

			[F] Configurator -- root
				[F] Common -- data used between components
					[P] (Color) TeamNeutralColor
					[P] (Color) TeamEnemyColor
					[P] (Color) TeamFriendlyColor
					[P] (Color) TeamSelfColor
				[F] Titles -- title data
					[P] (Core Object Reference) DefaultTitle
					[E] ConfiguratorTitle
						[E] ConfiguratorPlayer
				[F] Handler -- handler component configuration
					[P] (Core Object Reference) HandlerInstance
					[P] (Int) IconCount
					[P] (String) IconEllipsisID
					[P] (Asset Reference, Template) TitleSessionDataTemplate
					[P] (Asset Reference, Template) PlayerSessionDataTemplate
				[F] Nameplates -- optional, nameplates component configuration
					[F] Icons
						[E] ConfiguratorIcon
					[P] (String, Color Mode) NameColorMode
					[P] (Color) NameStaticColor
					[P] (String, Color Mode) HealthbarColorMode
					[P] (Color) HealthbarStaticColor
					[P] (Bool) ShowSelf
					[P] (Bool) ShowNeutral
					[P] (Bool) ShowEnemy
					[P] (Bool) ShowFriendly
					[P] (Asset Reference, Template) NameplateTemplate
					[P] (Asset Reference, Template) SocketHelper
				[F] List -- optional, list component configuration
					[P] (String, Color Mode) NameColorMode
					[P] (Color) NameStaticColor
					[P] (String, Color Mode) SidebarColorMode
					[P] (Color) SidebarStaticColor
					[P] (Bool) ShowSelf
					[P] (Bool) ShowNeutral
					[P] (Bool) ShowEnemy
					[P] (Bool) ShowFriendly
					[P] (String, Key Binding) KeybindToggle
					[P] (Simple Curve) EasingCurveIn
					[P] (Simple Curve) EasingCurveOut
					[P] (Asset Reference, Template) EntryTemplate
				[F] Scoreboard -- optional, scoreboard component configuration
					[F] Scores
						[E] ConfiguratorScore
					[P] (String, Color Mode) NameColorMode
					[P] (Color) NameStaticColor
					[P] (String, Color Mode) SidebarColorMode
					[P] (Color) SidebarStaticColor
					[P] (Bool) ShowSelf
					[P] (Bool) ShowNeutral
					[P] (Bool) ShowEnemy
					[P] (Bool) ShowFriendly
					[P] (String, Key Binding) KeybindToggle
					[P] (Simple Curve) EasingCurveIn
					[P] (Simple Curve) EasingCurveOut
					[P] (Asset Reference, Template) EntryTemplate

	2.3. Titles
		Titles, as described in the package's description, allow game creators to give special roles to themselves, dedicated players, and anyone they deem fit for recognition.
		These titles can use different colors, icons, and hold metadata (like the IsModerator property) to be used in code.
		Titles can be added either by adding title entries in the configurator (Configurator/Titles) - this way you can also assign titles to specific players, by adding
		player entries inside the title entry (as children) - or by using the Config.CreateOverrideTitle function from the Config module.
		Titles created using the first method are Static Titles, while the ones from the second method are Override Titles (you can use them to override Static Titles)
		or Session Titles (they only last for the current server session).
		Override Titles can be modified using Config.ModifyOverrideTitle and assigned using Config.SetOverrideTitle.

		When adding Static Title entries, the name of an entry (its CoreObject in hierarchy) will be used as the TitleID under which the title will be assigned.
		This TitleID is used in many of the API functions to access the title from code.

	2.4. Icons
		Icons are small image boxes that show up under a player's nameplate. They can be used as status effects with durations, item slot displays... or whatever else you wish.
		These Icons can be applied to players using Config.AddPlayerIcon and taken away using Config.RemovePlayerIcon functions from the Config module.
		Before you can apply an Icon, though, you'll have to define it in the Configurator first. This is done so that Player Titles doesn't have to replicate Icon data for every
		separate Icon for every player. This lets us save up on networking traffic by a lot.
		Icons can be defined under the Nameplates folder in the Icons folder in the Configurator. Adding one is as simple as dragging a ConfiguratorIcon template into it
		and configuring its properties to fit your needs. The name of the entry (the CoreObject that you put into the hierarchy) will be used as the IconID, which is needed in
		order to actually tell the Config.AddPlayerIcon function which Icon to add, so set it to something reasonable.
		IconIDs are not to be confused with IconUIDs, which are unique Icon IDs returned by the Config.AddPlayerIcon function. Those unique IDs can be passed to the
		Config.RemovePlayerIcon function in order to remove the icons that are assigned to them.

	2.5. API Documentation
		The API isn't documented here, as that delves into a bit more advanced territory. Fortunately, you can find the descriptions and usage of *every* function used in
		Player Titles right above their definitions. As such, all of the Config module functions are documented in the ConfigurationReader script, where they are defined.

		A function's documentation should look something like this:
			--	returnType functionName(parameterType...)
			--	description

		The returnType is just the type of value that's returned when the function is called.
		FunctionName is self-explanatory, and so is the rest, really.
		The only thing that you might find unintuitive is the way some of the types are documented here.
		For example, you might come across stuff like table<TitleData> or string<TitleID>.
		table<TitleData> would just mean that the type is a table, but the table itself is in the same format as TitleData (title entries) from the Config module.
		TitleIDs are the table indexes used to store TitleData. TitleSessionData instances are just CoreObjects that hold Override Title data, in the same format
		as Static Titles in hierarchy do. PlayerSessionData is like TitleSessionData, but with Player Titles related player data, like their current override title, icons etc.
		There are likely more types that will be added in the future, but they should be documented somewhere or be at least somewhat obvious.
		Usually, you don't actually need to know what these types really are when using the API, you just need to distinguish between them and know where to access them from.
		That should be covered by the API documentation.

	------------------------------------------------------------------------------------------------------------------------
	3.	Components
	------------------------------------------------------------------------------------------------------------------------
	3.1. Nameplates
		This components takes care of creating UI nameplates above player heads. These display their nickname, health, avatar, title, party and icons.
		Icons are small image boxes that show up under a player's healthbar when applied to them. They can be added and removed using
		Config.AddPlayerIcon and Config.RemovePlayerIcon (functions from the Config module) respectively, but only from the server.
		The Handler takes care of the replication process (networking) on its own.

	3.2. List
		The List is a component that displays the players currently connected to the game in a list. Player entry visibility can be filtered
		by their team relation to the local player (check the Configurator). Each entry displays the player's avatar, title and party.

	3.3. Scoreboard
		The Scoreboard works in a similar fashion to the List, except it additionally supports player Scores. A Score is a displayed value on the Scoreboard, which
		can be assigned to either a player resource or a property of a player object (like Player.kills).

	3.4. Handler
		This component manages session data (like custom override titles, nameplate icons etc.) and handles its replication to the clients through networked custom properties.
		Override titles can be created using Config.CreateOverrideTitle, modified using Config.ModifyOverrideTitle and set for players using
		Config.SetOverrideTitle (functions from the Config module).
		Nameplate Icons can be added and removed using Config.AddPlayerIcon and Config.RemovePlayerIcon (also functions from the Config module).

	------------------------------------------------------------------------------------------------------------------------
	4.	Contributing
	------------------------------------------------------------------------------------------------------------------------
		I (Chipnertkj) put a lot of work into cleaning this package up, so try to keep it tidy ;).
		Here are some general guidelines you should follow if you want to add new code to Player Titles:

			-	Where needed, use the Config setup described in 1.2.2. Avoid accessing the module through _G.

			-	Scripts should be divided into sections, just like this documentation, and should start with a header describing their purpose and
				other useful info about them. Check the component handler scripts for examples.

			-	Abstract related instruction sets into functions. Replace copy-pasted code with function calls.
				If you find yourself copying some code over in the same script, it's definitely better to create a function for this specific purpose instead.
				Same thing when it comes to code that could eventually end up being used in multiple occasions.
				Check the component handler scripts for examples of this practice.

			-	If you find yourself using the same code in several different scripts, consider creating a function for this specific purpose in the Config module instead.

			-	Avoid creating more modules. Requiring the Config module is enough of a hassle.

			-	If possible, try to integrate new functionality into the existing components instead of creating new ones.

			-	Use the Configurator instead of custom properties on components. Generally prefer Configurator properties for anything configurable.

			-	Update the documentation (this script!) after making changes to Player Titles.

			-	Add a two-line or longer comment above each function in every script. The first one should describe the return type, function name and parameters.
				The rest should describe what the function is supposed to be used for. This serves as a secondary documentation for anyone working with the actual code.

			-	Refer to the Team Meta CC Guidelines for overall code and editor guidelines.
]]
