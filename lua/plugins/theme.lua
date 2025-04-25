return {
	{"EdenEast/nightfox.nvim", lazy=true}, -- huidige theme
	"nvim-tree/nvim-tree.lua", -- file explorer
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = { -- set to setup table
		},

	},

	{'nvim-lualine/lualine.nvim',
	dependencies = { 'kyazdani42/nvim-web-devicons' }},
}
