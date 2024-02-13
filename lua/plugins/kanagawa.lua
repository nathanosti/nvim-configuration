return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		name = "kanagawa",
		priority = 1000,
		config = function()
			local kanagawa_config = require("kanagawa")

			kanagawa_config.setup({
				transparent = true,
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				dimInactive = false,
				terminalColors = true,
				theme = "wave",
				background = {
					dark = "dragon",
					light = "lotus",
				},
			})

			vim.cmd.colorscheme("kanagawa")
		end,
	},
}
