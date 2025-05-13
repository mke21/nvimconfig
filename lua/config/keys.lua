--[[ keys.lua ]]
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

local function nkeymap(key, map)
  keymap('n', key, map, opts)
end

-- window navigatie
nkeymap('<c-j>', '<c-w>j')
nkeymap('<c-h>', '<c-w>h')
nkeymap('<c-k>', '<c-w>k')
nkeymap('<c-l>', '<c-w>l')

-- Buffer navigatie
nkeymap('<c-right>', ':bn<CR>')
nkeymap('<c-left>',  ':bp<CR>')

-- tab navigatie
nkeymap('<m-right>', ':tabnext<CR>')
nkeymap('<m-left>',  ':tabprev<CR>')
nkeymap('<m-up>',    ':tabnew %<CR>')
nkeymap('<m-down>',  ':tabclose<CR>')

-- resize windows
nkeymap('<Up>',    ':resize -2<CR>'          )
nkeymap('<Down>',  ':resize +2<CR>'          )
nkeymap('<Left>',  ':vertical resize -2<CR>' )
nkeymap('<Right>', ':vertical resize +2<CR>' )

-- nvim-tree
nkeymap('<c-n>', ':NvimTreeToggle<CR>')
--
-- zet directory van huidige buffer als werk
nkeymap('<leader>cd', ':cd %:p:h<CR>:pwd<CR>')

-- toggle spellcheck
nkeymap('<leader>sp', ':setlocal spell!<CR>')

-- copilot aanvullen
keymap('i', '<m-c>', 'copilot#Accept("<CR>")', {expr = true, silent = true})
keymap('i', '<m-e>', 'copilot#Dismiss()', {expr = true, silent = true})

-- fuzzyfinding
nkeymap('<leader>ff', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
nkeymap('<leader>rr', '<cmd>Telescope lsp_references<cr>')
