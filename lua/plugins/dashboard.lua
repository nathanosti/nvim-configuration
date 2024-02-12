return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		local dashboard_config = require("dashboard")

		dashboard_config.setup({
			theme = "hyper",
			config = {
				header = {
					"$$$$$$$$\\                 $$\\       $$\\           ",
					"\\__$$  __|                $$ |      $$ |          ",
					"   $$ |    $$$$$$\\   $$$$$$$ | $$$$$$$ |$$\\   $$\\ ",
					"   $$ |   $$  __$$\\ $$  __$$ |$$  __$$ |$$ |  $$ |",
					"   $$ |   $$$$$$$$ |$$ /  $$ |$$ /  $$ |$$ |  $$ |",
					"   $$ |   $$   ____|$$ |  $$ |$$ |  $$ |$$ |  $$ |",
					"   $$ |   \\$$$$$$$\\ \\$$$$$$$ |\\$$$$$$$ |\\$$$$$$$ |",
					"   \\__|    \\_______| \\_______| \\_______| \\____$$ |",
					"                                        $$\\   $$ |",
					"                                        \\$$$$$$  |",
					"                                         \\______/ ",
					" $$$$$$\\                  $$\\                     ",
					"$$  __$$\\                 $$ |                    ",
					"$$ /  \\__| $$$$$$\\   $$$$$$$ | $$$$$$\\   $$$$$$\\  ",
					"$$ |      $$  __$$\\ $$  __$$ |$$  __$$\\ $$  __$$\\ ",
					"$$ |      $$ /  $$ |$$ /  $$ |$$$$$$$$ |$$ |  \\__|",
					"$$ |  $$\\ $$ |  $$ |$$ |  $$ |$$   ____|$$ |      ",
					"\\$$$$$$  |\\$$$$$$  |\\$$$$$$$ |\\$$$$$$$\\ $$ |      ",
					" \\______/  \\______/  \\_______| \\_______|\\__|      ",
					"",
					"",
					"Developed by Nathan Osti",
					"",
					"",
				},
				shortcut = {
					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = " Apps",
						group = "DiagnosticHint",
						action = "Telescope app",
						key = "a",
					},
					{
						desc = " dotfiles",
						group = "Number",
						action = "Telescope dotfiles",
						key = "d",
					},
				},
				footer = {
					"",
					"",
					"Desespere-se com calma!",
				},
			},
		})
	end,
}