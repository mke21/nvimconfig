-- [[ vars.lua ]]

local g = vim.g

g.t_co = 256
g.background = "dark"

--[[ opts.lua ]]
local opt = vim.opt

-- [[ Context ]]
opt.colorcolumn = '100'           -- str:  Show col for max line length
opt.number = true                -- bool: Show line numbers
opt.relativenumber = true        -- bool: Show relative line numbers
opt.scrolloff = 4                -- int:  Min num lines of context
opt.signcolumn = "yes"           -- str:  Show the sign column
opt.colorcolumn = '55555'
opt.mouse = "a"                  -- str: enable mouse
opt.clipboard = "unnamedplus"    -- str: sync clipboard with os

-- [[ Filetypes ]]
opt.encoding = 'utf8'            -- str:  String encoding to use
opt.fileencoding = 'utf8'        -- str:  File encoding to use
opt.cursorline = true            -- bool: Highlight current line

-- [[ Theme ]]
opt.syntax = "ON"                -- str:  Allow syntax highlighting
opt.termguicolors = true         -- bool: If term supports ui color then enable

-- [[ Search ]]
opt.ignorecase = true            -- bool: Ignore case in search patterns
opt.smartcase = true             -- bool: Override ignorecase if search contains capitals
opt.incsearch = true             -- bool: Use incremental search
opt.hlsearch = false             -- bool: Highlight search matches

-- bool: Use spaces instead of tabs
opt.shiftwidth = 4               -- num:  Size of an indent
opt.softtabstop = 4              -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4                  -- num:  Number of spaces tabs count for

-- [[ Splits ]]
opt.splitright = true            -- bool: Place new window to right of current one
opt.splitbelow = true            -- bool: Place new window below the current one

-- [[ update time ]]
opt.updatetime = 250
opt.timeout = true
opt.timeoutlen = 300

-- [[ completion ]]
opt.completeopt = "menuone,noselect"

-- [[ Filetype specific ]]
vim.api.nvim_create_autocmd("FileType", { -- set tabstop to 2 spaces in javascript files
	pattern = "javascript",
	command = "setlocal ts=2 sw=2 sts=2"})

vim.api.nvim_create_autocmd("FileType", { -- set maximum width of text to 80 characters in  markdown files
	pattern = "markdown",
	command = "setlocal textwidth=80"})
