-- [[ init.lua ]]
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- LEADER
vim.g.mapleader = " "
vim.g.localleader = "\\"


-- IMPORTS
require('config.vars')
require('config.lazy')
require('config.theme')
require('config.ntree')
require('config.keys')
require('config.commands')
require('config.lsp')
require('config.markdown')
require('config.terminal')
require('config.neovide')
