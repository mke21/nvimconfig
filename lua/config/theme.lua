require('nightfox').setup({
  options = {
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "italic,bold",
      operators = "bold",
    }

  }
})
vim.cmd("colorscheme carbonfox")

require 'colorizer'.setup();


--[[ statusline.lua ]]
local function pwd()
	local path = vim.fn.getcwd()
	return path
end


require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'material',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {pwd, 'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},	
	tabline = {
		lualine_a = {'buffers'},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {'tabs'}
	},
	extensions = {}
}
